import 'package:flutter/material.dart';
import 'cartItem.dart';

class CartScreen extends StatefulWidget {
  final List<CartItem> cartItems;
  final VoidCallback onCartValidated;

  CartScreen({required this.cartItems, required this.onCartValidated});

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Panier"),
        actions: [
          TextButton(
            onPressed: widget.cartItems.isNotEmpty
                ? () {
              widget.onCartValidated();
              Navigator.pop(context);
            }
                : null,
            child: Text(
              "Valider le panier",
              style: TextStyle(
                color: widget.cartItems.isNotEmpty
                    ? Colors.white
                    : Colors.grey,
              ),
            ),
          ),
        ],
      ),
      body: widget.cartItems.isNotEmpty
          ? ListView.builder(
        itemCount: widget.cartItems.length,
        itemBuilder: (context, index) {
          final cartItem = widget.cartItems[index];
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
