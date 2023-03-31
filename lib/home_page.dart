import 'package:flutter/material.dart';
import 'package:sae_mobile/productVue.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Accueil"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProductsScreen()),
            );
          },
          child: Text("Voir les produits"),
        ),
      ),
    );
  }
}
