import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './screens/product_detail_screen.dart';
import './screens/products_overview_screen.dart';
import './providers/products.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => Products(),
      child: MaterialApp(
        title: 'ShopMax',
        theme: ThemeData(
          primarySwatch: Colors.deepPurple,
          accentColor: Colors.indigoAccent,
          fontFamily: 'Lato',
        ),
        home: ProductOverviewPage(),
        routes: {
          ProductDetailScreen.routePath: (ctx) => ProductDetailScreen(),
        },
      ),
    );
  }
}
