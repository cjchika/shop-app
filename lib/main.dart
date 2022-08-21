import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/screens/product_detail_screen.dart';

import './screens/products_overview_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
    );
  }
}
