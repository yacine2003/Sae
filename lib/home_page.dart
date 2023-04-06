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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProductsScreen()),
                );
              },
              child: Text("Voir les produits"),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/login');
              },
              child: Text("Se connecter"),
            ),
          ],
        ),
      ),
    );
  }
}

