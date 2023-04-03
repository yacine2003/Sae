import 'package:flutter/material.dart';

import 'cartItem.dart';

class CartScreen extends StatelessWidget {
  final List<CartItem> cartItems;

  CartScreen({required this.cartItems});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Panier"),
      ),
      body: cartItems.isNotEmpty
          ? ListView.builder(
        itemCount: cartItems.length,
        itemBuilder: (context, index) {
          final cartItem = cartItems[index];
          final product = cartItem.product;

          return ListTile(
            leading: Image.network(product.image),
            title: Text(product.title),
            subtitle: Text(product.description),
            trailing: Text(
              'x${cartItem.quantity} - \$${(product.price * cartItem.quantity).toStringAsFixed(2)}',
              textAlign: TextAlign.end,
            ),
          );
        },
      )
          : Center(
        child: Text("Le panier est vide"),
      ),
    );
  }
}
