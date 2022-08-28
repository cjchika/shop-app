import 'dart:convert' as convert;

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class Product with ChangeNotifier {
  final String id;
  final String title;
  final String description;
  final double price;
  final String imageUrl;
  bool isFavorite;

  Product({
    @required this.id,
    @required this.title,
    @required this.description,
    @required this.price,
    @required this.imageUrl,
    this.isFavorite = false,
  });

  void _saveFav(bool oldFav) {
    isFavorite = oldFav;
    notifyListeners();
  }

  Future<void> toggleFavoriteStatus(String token, String userId) async {
    var _params = {'auth': token};
    final oldStatus = isFavorite;
    isFavorite = !isFavorite;
    notifyListeners();
    final url = Uri.https('flutter-app-ecb05-default-rtdb.firebaseio.com',
        'userFavorites/$userId/$id.json', _params);
    try {
      final response = await http.put(
        url,
        body: convert.json.encode(
          isFavorite,
        ),
      );
      if (response.statusCode >= 400) {
        _saveFav(oldStatus);
      }
    } catch (error) {
      _saveFav(oldStatus);
    }
  }
}
