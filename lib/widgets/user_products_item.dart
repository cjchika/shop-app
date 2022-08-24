import 'package:flutter/material.dart';

class UserProductsItem extends StatelessWidget {
  final String title;
  final String imageUrl;

  UserProductsItem(this.title, this.imageUrl);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      leading: CircleAvatar(
        backgroundImage: NetworkImage(imageUrl),
      ),
      trailing: Row(mainAxisSize: MainAxisSize.min, children: [
        IconButton(
          onPressed: () {},
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
