import 'package:flutter/material.dart';

import '../screens/product_detail_screen.dart';

class ProductItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;

  ProductItem(this.id, this.title, this.imageUrl);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        footer: GridTileBar(
          backgroundColor: Colors.black87,
          leading: const IconButton(
            icon: Icon(
              Icons.favorite,
              color: Colors.indigoAccent,
            ),
            onPressed: null,
          ),
          title: Text(
            title,
            textAlign: TextAlign.center,
          ),
          trailing: const IconButton(
            icon: Icon(
              Icons.shop,
              color: Colors.indigoAccent,
            ),
            onPressed: null,
          ),
        ),
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(
              ProductDetailScreen.routePath,
              arguments: id,
            );
          },
          child: Image.network(
            imageUrl,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
