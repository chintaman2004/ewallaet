import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? user;
  bool isLoading = false;
  String? error;

  AuthProvider() {
    _auth.authStateChanges().listen(_onAuthStateChanged);
  }

  void _onAuthStateChanged(User? u) {
    user = u;
    notifyListeners();
  }

  Future<void> signUp({required String email, required String password}) async {
    try {
      isLoading = true;
      error = null;
      notifyListeners();
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      error = e.message;
    } catch (e) {
      error = e.toString();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> signIn({required String email, required String password}) async {
    try {
      isLoading = true;
      error = null;
      notifyListeners();
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      error = e.message;
    } catch (e) {
      error = e.toString();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> sendPasswordReset({required String email}) async {
    try {
      isLoading = true;
      error = null;
      notifyListeners();
      await _auth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      error = e.message;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }
}
