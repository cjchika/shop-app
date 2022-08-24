import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/products.dart';
import '../widgets/user_products_item.dart';
import '../widgets/app_drawer.dart';

class UserProductScreen extends StatelessWidget {
  static const routePath = '/user-products';

  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);

    return Scaffold(
        appBar: AppBar(
          title: const Text('Manage Your Products'),
          actions: [
            IconButton(
              onPressed: () {
                //..
              },
              icon: const Icon(Icons.add),
            ),
          ],
        ),
        drawer: AppDrawer(),
        body: Padding(
          padding: EdgeInsets.all(8),
          child: ListView.builder(
            itemCount: productsData.items.length,
            itemBuilder: (_, idx) => Column(
              children: [
                UserProductsItem(
                  productsData.items[idx].title,
                  productsData.items[idx].imageUrl,
                ),
                Divider(),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.deepPurple,
          child: IconButton(
            icon: Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
          onPressed: () {},
        ));
  }
}
