import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthViewModel extends ChangeNotifier {
  bool _isRegistered = false;
  bool get isRegistered => _isRegistered;

  // Firebase instance
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Load registration state from shared preferences
  AuthViewModel() {
    _loadUserStatus();
  }

  Future<void> _loadUserStatus() async {
    final prefs = await SharedPreferences.getInstance();
    _isRegistered = prefs.getBool('isRegistered') ?? false;
    notifyListeners();
  }

  // Register user method
  Future<void> registerUser(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      await _setUserRegistered();
    } catch (e) {
      print('Error registering user: $e');
      // You might want to throw an error or handle it here
    }
  }

  // Set user as registered in shared preferences
  Future<void> _setUserRegistered() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isRegistered', true);
    _isRegistered = true;
    notifyListeners();
  }

  // Sign-in logic
  Future<bool> signInUser(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      _isRegistered = true;
      notifyListeners();
      return true; // Return true on success
    } catch (e) {
      print('Error signing in: $e');
      return false; // Return false on failure
    }
  }

  // Sign-out logic
  Future<void> signOut() async {
    await _auth.signOut();
    _isRegistered = false;
    notifyListeners();
  }
}
