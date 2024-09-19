import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

enum ViewState { idle, busy }

class LogInViewModel extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  String _message = '';
  String get message => _message;

  ViewState _state = ViewState.idle;
  ViewState get state => _state;

  // Login function
  Future<void> login() async {
    _setState(ViewState.busy);
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      _message = 'Login successful: ${userCredential.user!.email}';
    } catch (e) {
      _message = 'Login failed: $e';
    } finally {
      _setState(ViewState.idle);
    }
  }

  // Sign out function
  Future<void> signOut() async {
    _setState(ViewState.busy);
    try {
      await _auth.signOut();
      _message = 'Signed out';
    } catch (e) {
      _message = 'Sign-out failed: $e';
    } finally {
      _setState(ViewState.idle);
    }
  }

  // Helper to update the state
  void _setState(ViewState state) {
    _state = state;
    notifyListeners();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
