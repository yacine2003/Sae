import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sae_mobile/auth_service.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final AuthService _authService = AuthService();
  String _email = '';
  String _password = '';

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      signUp(_email, _password);
    }
  }


  Future<void> signUp(String email, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      print('User registered: ${userCredential.user}');
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      print('Error registering user: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Inscription"),
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
                keyboardType: TextInputType.text,
                obscureText: true,
                validator: (value) => (value?.length ?? 0) < 6 ? "Le mot de passe doit contenir au moins 6 caractères" : null,

                onSaved: (value) => _password = value!,
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: _submitForm,
                child: Text("S'inscrire"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
