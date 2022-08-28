import 'dart:convert' as convert;

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import './cart.dart';

class OrderItem {
  final String id;
  final double amount;
  final List<CartItem> products;
  final DateTime dateTime;

  OrderItem({
    @required this.id,
    @required this.amount,
    @required this.dateTime,
    @required this.products,
  });
}

class Orders with ChangeNotifier {
  List<OrderItem> _orders = [];
  final String authToken;
  final String userId;

  Orders(this.authToken, this.userId, this._orders);

  List<OrderItem> get orders {
    return [..._orders];
  }

  Future<void> fetchOrders() async {
    var _params = {'auth': authToken};
    final url = Uri.https('flutter-app-ecb05-default-rtdb.firebaseio.com',
        'orders/$userId.json', _params);
    final response = await http.get(url);
    final List<OrderItem> loadedOrders = [];
    final extractedData = convert.json.decode(response.body);
    if (extractedData == null) {
      return;
    }
    extractedData.forEach((orderId, orderData) {
      loadedOrders.add(OrderItem(
        id: orderId,
        amount: orderData['amount'],
        dateTime: DateTime.parse(orderData['dateTime']),
        products: (orderData['products'] as List<dynamic>)
            .map(
              (prodItem) => CartItem(
                id: prodItem['id'],
                price: prodItem['price'],
                quantity: prodItem['quantity'],
                title: prodItem['title'],
              ),
            )
            .toList(),
      ));
    });
    _orders = loadedOrders.reversed.toList();
    notifyListeners();
  }

  void addOrder(List<CartItem> cartProducts, double total) async {
    var _params = {'auth': authToken};
    final url = Uri.https('flutter-app-ecb05-default-rtdb.firebaseio.com',
        'orders/$userId.json', _params);
    final timeStamp = DateTime.now();
    final response = await http.post(url,
        body: convert.json.encode({
          'amount': total,
          'dateTime': timeStamp.toIso8601String(),
          'products': cartProducts
              .map((cp) => {
                    'id': cp.id,
                    'title': cp.title,
                    'quantity': cp.quantity,
                    'price': cp.price,
                  })
              .toList(),
        }));
    _orders.insert(
      0,
      OrderItem(
        id: convert.json.decode(response.body)['name'],
        amount: total,
        dateTime: timeStamp,
        products: cartProducts,
      ),
    );
    notifyListeners();
  }
}
