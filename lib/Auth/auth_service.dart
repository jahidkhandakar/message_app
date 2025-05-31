import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  //?______________instance of Auth_______________
  final firebaseAuth = FirebaseAuth.instance;

  //?______________sign user up __________________
  Future<UserCredential> signUp(String email, String password) async {
    try {
      UserCredential userCredential = await firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw Exception('Error signing up: $e');
    }
  }

  //?______________sign user in __________________
  Future<UserCredential> signIn(String email, String password) async {
    try {
      //sign in
      UserCredential userCredential = await firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw Exception('Error signing in: $e');
    }
  }

  //?______________sign user out _________________
  Future<void> signOut() async {
    try {
      await firebaseAuth.signOut();
    } on FirebaseAuthException catch (e) {
      throw Exception('Error signing out: $e');
    }
  }
}
