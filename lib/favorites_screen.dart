import 'package:flutter/material.dart';
import 'package:sae_mobile/product.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Product> favoriteProducts;

  FavoritesScreen({required this.favoriteProducts});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Produits favoris"),
      ),
      body: favoriteProducts.isNotEmpty
          ? ListView.builder(
        itemCount: favoriteProducts.length,
        itemBuilder: (context, index) {
          final product = favoriteProducts[index];

          return ListTile(
            leading: Image.network(product.image),
            title: Text(product.title),
            subtitle: Text(product.description),
            trailing: Text(
              '\$${product.price.toStringAsFixed(2)}',
              textAlign: TextAlign.end,
            ),
          );
        },
      )
          : Center(
        child: Text("Aucun produit favori"),
      ),
    );
  }
}
