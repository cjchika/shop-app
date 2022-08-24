import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../screens/edit_product_screen.dart';
import '../providers/products.dart';

class UserProductsItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;

  UserProductsItem(this.id, this.title, this.imageUrl);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      leading: CircleAvatar(
        backgroundImage: NetworkImage(imageUrl),
      ),
      trailing: Row(mainAxisSize: MainAxisSize.min, children: [
        IconButton(
          onPressed: () {
            Navigator.of(context)
                .pushNamed(EditProductScreen.routePath, arguments: id);
          },
          icon: Icon(Icons.edit),
          color: Colors.greenAccent,
        ),
        IconButton(
          onPressed: () {
            Provider.of<Products>(context, listen: false).deleteProduct(id);
          },
          icon: Icon(Icons.delete),
          color: Colors.redAccent,
        ),
      ]),
    );
  }
}
