import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

enum FacebookState { idle, error, success, loading }

class AuthService extends ChangeNotifier {
  final storage = const FlutterSecureStorage();

  // Google signup or login
  Future<void> googleSignUpOrLogin(String googleToken) async {
    final response = await http.post(
      Uri.parse('http://192.168.1.108:8000/api/auth/google-signup'),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({'token': googleToken}), // Send Google token
    );

    if (response.statusCode == 200) {
      // Parse the token from the response
      final responseData = jsonDecode(response.body);
      final authToken = responseData['token'];

      // Store the token securely
      await storeToken(authToken);
    } else {
      // Handle error
      throw Exception('Google sign-in failed');
    }
  }

  Future<void> storeToken(String token) async {
    await storage.write(key: 'userToken', value: token);
  }

  Future<String?> getToken() async {
    return await storage.read(key: 'userToken');
  }

  // Facebook signup or login
  FacebookState _state = FacebookState.idle;
  FacebookState get state => _state;

  String _message = '';
  String get message => _message;

  // Example method for Facebook signup or login
  Future<void> facebookSignUpOrLogin(String token) async {
    _setState(FacebookState.loading);
    try {
      // Call your API with the token
      final response = await http.post(
        Uri.parse('https://192.168.1.108:8000/api/auth/facebook-signup'),
        headers: {
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        _setMessage('Signup successful!');
        _setState(FacebookState.success);
      } else {
        _setMessage('Signup failed: ${response.body}');
        _setState(FacebookState.error);
      }
    } catch (error) {
      _setMessage('An error occurred: $error');
      _setState(FacebookState.error);
    }
  }

  // Private methods to manage state
  void _setState(FacebookState state) {
    _state = state;
    notifyListeners(); // Notifies the UI to update
  }

  void _setMessage(String message) {
    _message = message;
  }
}
