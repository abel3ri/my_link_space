import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart'; // Import the google_sign_in package
import 'package:http/http.dart' as http;
import 'dart:convert';

// Define SignupState enum
enum SignupState { idle, loading, success, error }

class GoogleSignupViewModel extends ChangeNotifier {
  SignupState _state = SignupState.idle;
  String _message = '';
  bool _isLoading = false;
  bool _isSuccess = false;

  final GoogleSignIn _googleSignIn = GoogleSignIn();
  bool get isLoading => _isLoading;
  bool get isSuccess => _isSuccess;
  SignupState get state => _state;
  String get message => _message;

  Future<void> googleSignup(String email) async {
    _setState(SignupState.loading);

    try {
      final response = await http.post(
        Uri.parse('http://192.168.1.108/auth/google-signup'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({'email': email}),
      );

      if (response.statusCode == 200) {
        _setSuccess(true);
        _setState(SignupState.success);
        _message = 'Signup successful';
      } else {
        _setSuccess(false);
        _setState(SignupState.error);
        _message = 'Failed to sign up: ${response.body}';
      }
    } catch (e) {
      _setSuccess(false);
      _setState(SignupState.error);
      _message = 'Error: $e';
    } finally {
      _setLoading(false);
    }
  }

  Future<void> pickAccount() async {
    try {
      final GoogleSignInAccount? account = await _googleSignIn.signIn();

      if (account != null) {
        await googleSignup(account.email);
      } else {
        _message = 'No account selected';
        _setState(SignupState.idle);
      }
    } catch (e) {
      _message = 'Error selecting account: $e';
      _setState(SignupState.error);
    }
  }

  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  void _setSuccess(bool value) {
    _isSuccess = value;
    notifyListeners();
  }

  void _setState(SignupState value) {
    _state = value;
    notifyListeners();
  }
}
