import 'package:flutter/material.dart';
import '../screens/orders_screen.dart';
import '../screens/user_product_screen.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(children: [
        AppBar(
          title: Text('Hello!'),
          automaticallyImplyLeading: false,
        ),
        Divider(),
        ListTile(
          leading: Icon(Icons.shop_two_rounded),
          title: Text('Shop'),
          onTap: () {
            Navigator.of(context).pushReplacementNamed('/');
          },
        ),
        Divider(),
        ListTile(
          leading: Icon(Icons.payment_rounded),
          title: Text('Payment'),
          onTap: () {
            Navigator.of(context).pushReplacementNamed(OrderScreen.routPath);
          },
        ),
        Divider(),
        ListTile(
          leading: Icon(Icons.shopping_bag_rounded),
          title: Text('Manage Products'),
          onTap: () {
            Navigator.of(context)
                .pushReplacementNamed(UserProductScreen.routePath);
          },
        )
      ]),
    );
  }
}
