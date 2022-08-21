import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;

  ProductItem(this.id, this.title, this.imageUrl);

  @override
  Widget build(BuildContext context) {
    return GridTile(
      footer: GridTileBar(
        backgroundColor: Colors.black45,
        leading: const IconButton(
          icon: Icon(Icons.favorite),
          onPressed: null,
        ),
        title: Text(
          title,
          textAlign: TextAlign.center,
        ),
        trailing: const IconButton(
          icon: Icon(Icons.shop),
          onPressed: null,
        ),
      ),
      child: Image.network(
        imageUrl,
        fit: BoxFit.cover,
      ),
    );
  }
}
