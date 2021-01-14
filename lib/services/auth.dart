import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final auth = FirebaseAuth.instance;

  Future emailSignIn(String _email, String _password) async {
    await auth.signInWithEmailAndPassword(email: _email, password: _password);
  }

  Future emailSignUp(String _email, String _password) async {
    await auth.createUserWithEmailAndPassword(
        email: _email, password: _password);
  }

  Future signOut() async {
    await auth.signOut();
  }
}
