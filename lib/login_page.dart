import 'package:flutter/material.dart';
import 'package:sae_mobile/auth_service.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final AuthService _authService = AuthService();
  String _email = '';
  String _password = '';

  Future<void> _signIn() async {
    if (_formKey.currentState?.validate() ?? false) {
      _formKey.currentState?.save();
      final userCredential = await _authService.signInWithEmailAndPassword(_email, _password);
      if (userCredential != null) {
        Navigator.pop(context);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Erreur lors de la connexion")),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Connexion"),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'E-mail'),
                keyboardType: TextInputType.emailAddress,
                validator: (value) => (value?.isEmpty ?? true) ? "Veuillez entrer un e-mail" : null,
                onSaved: (value) => _email = (value ?? "").trim(),
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Mot de passe'),
                obscureText: true,
                validator: (value) => (value?.length ?? 0) < 6 ? "Le mot de passe doit contenir au moins 6 caractères" : null,
                onSaved: (value) => _password = value!,
              ),
              SizedBox(height: 32.0),
              ElevatedButton(
                onPressed: _signIn,
                child: Text('Se connecter'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
