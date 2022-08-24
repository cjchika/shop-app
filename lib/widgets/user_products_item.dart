import 'package:flutter/material.dart';

import '../screens/edit_product_screen.dart';

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
          onPressed: () {},
          icon: Icon(Icons.delete),
          color: Colors.redAccent,
        ),
      ]),
    );
  }
}
