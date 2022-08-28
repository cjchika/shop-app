import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../screens/orders_screen.dart';
import '../screens/user_product_screen.dart';
import '../providers/auth.dart';
import '../screens/auth_screen.dart';

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
        ),
        Divider(),
        ListTile(
          leading: Icon(Icons.exit_to_app_rounded),
          title: Text('Logout'),
          onTap: () {
            //Navigator.of(context).pop();
            //   Navigator.of(context)
            //       .pushReplacementNamed(UserProductScreen.routePath);
            Provider.of<Auth>(context, listen: false).logout();
          },
        ),
      ]),
    );
  }
}
