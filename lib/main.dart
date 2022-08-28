import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './screens/product_detail_screen.dart';
import './screens/products_overview_screen.dart';
import './providers/products.dart';
import './providers/cart.dart';
import './screens/cart_screen.dart';
import './providers/orders.dart';
import './screens/orders_screen.dart';
import './screens/user_product_screen.dart';
import './screens/edit_product_screen.dart';
import './screens/auth_screen.dart';
import './providers/auth.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => Auth(),
        ),
        ChangeNotifierProxyProvider<Auth, Products>(
          create: (ctx) => Products(null, []),
          update: (ctx, auth, previousProducts) => Products(
            auth.token,
            previousProducts == null ? [] : previousProducts.items,
          ),
        ),
        ChangeNotifierProvider(
          create: (ctx) => Cart(),
        ),
        ChangeNotifierProxyProvider<Auth, Orders>(
          create: (ctx) => Orders(null, []),
          update: (ctx, auth, previousOrders) => Orders(
            auth.token,
            previousOrders == null ? [] : previousOrders.orders,
          ),
        )
      ],
      child: Consumer<Auth>(
        builder: (ctx, auth, _) => MaterialApp(
          title: 'ShopMax',
          theme: ThemeData(
            primarySwatch: Colors.deepPurple,
            accentColor: Colors.indigoAccent,
            fontFamily: 'Lato',
          ),
          home: auth.isAuth ? ProductOverviewPage() : AuthScreen(),
          routes: {
            ProductDetailScreen.routePath: (ctx) => ProductDetailScreen(),
            CartScreen.routePath: (ctx) => CartScreen(),
            OrderScreen.routPath: (ctx) => OrderScreen(),
            UserProductScreen.routePath: (ctx) => UserProductScreen(),
            EditProductScreen.routePath: (ctx) => EditProductScreen(),
          },
        ),
      ),
    );
  }
}
