import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
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
                Navigator.pushNamed(context, '/login');
              },
              child: Text("Se connecter"),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/signup');
              },
              child: Text("S'inscrire"),
            ),
          ],
        ),
      ),
    );
  }
}
