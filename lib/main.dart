import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:sae_mobile/login_page.dart';
import 'package:sae_mobile/signup_page.dart';
import 'package:sae_mobile/welcome_page.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SAE Mobile',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: WelcomePage(), // Changez LoginPage() par WelcomePage()
      routes: {
        '/login': (context) => LoginPage(),
        '/signup': (context) => SignUpPage(),
      },
    );
  }
}

