import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  User? _user;
  User? get user => _user;

  AuthProvider() {
    _auth.authStateChanges().listen((firebaseUser) {
      _user = firebaseUser;
      notifyListeners();
    });
  }

  get currentUser => null;

  Future<String?> signup(
    String trim,
    String trim1,
    String trim2, {
    required String email,
    required String password,
  }) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return null; // success
    } on FirebaseAuthException catch (e) {
      return e.message ?? "Signup failed";
    } catch (e) {
      return "Something went wrong";
    }
  }

  Future<String?> login(
    String trim,
    String trim1, {
    required String email,
    required String password,
  }) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      return null; // success
    } on FirebaseAuthException catch (e) {
      return e.message ?? "Login failed";
    } catch (e) {
      return "Something went wrong";
    }
  }

  // Logout
  Future<void> signOut() async {
    await _auth.signOut();
  }

  // Send password reset email
  Future<String?> sendPasswordReset(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
      return null; // success
    } on FirebaseAuthException catch (e) {
      return e.message ?? "Password reset failed";
    } catch (e) {
      return "Something went wrong";
    }
  }
}
