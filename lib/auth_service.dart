import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Inscription
  Future<UserCredential?> registerWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential;
    } on FirebaseAuthException catch (e) {
      print("Erreur d'inscription: $e");
      return null;
    }
  }

  // Connexion
  Future<UserCredential?> signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential;
    } on FirebaseAuthException catch (e) {
      print("Erreur de connexion: $e");
      return null;
    }
  }

  // Déconnexion
  Future<void> signOut() async {
    await _auth.signOut();
  }
}
