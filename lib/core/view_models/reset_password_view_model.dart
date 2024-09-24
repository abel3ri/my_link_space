import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ResetPasswordViewModel extends ChangeNotifier {
  bool isLoading = false;
  String message = '';
  String email = '';
  String password = '';
  String passwordConfirmation = '';
  String token = '';

  void setEmail(String value) {
    email = value;
    notifyListeners();
  }

  void setPassword(String value) {
    password = value;
    notifyListeners();
  }

  void setPasswordConfirmation(String value) {
    passwordConfirmation = value;
    notifyListeners();
  }

  void setToken(String value) {
    token = value;
    notifyListeners();
  }

  Future<void> resetPassword() async {
    if (password != passwordConfirmation) {
      message = "Passwords do not match.";
      notifyListeners();
      return;
    }

    isLoading = true;
    notifyListeners();

    try {
      final response = await http.post(
        Uri.parse('http://192.168.1.108:8000/api/auth/reset-password/'),
        body: jsonEncode({
          'email': email,
          'code': token,
          'password': password,
          'password_confirmation': passwordConfirmation,
        }),
        headers: {'Content-Type': 'application/json'},
      );

      final responseData = jsonDecode(response.body);

      if (response.statusCode == 422) {
        if (responseData['errors'] != null) {
          String errorMessages = '';
          responseData['errors'].forEach((field, errors) {
            errorMessages += '$field: ${errors.join(', ')}\n';
          });
          message = 'Validation failed:\n$errorMessages';
        } else {
          message = 'Validation failed. Please check your input.';
        }
      } else if (responseData['status'] == 'success') {
        message = 'Password reset successfully!';
      } else {
        message = responseData['message'] ??
            'Failed to reset password. Please try again.';
      }
    } catch (e) {
      message = 'Error: ${e.toString()}';
    }

    isLoading = false;
    notifyListeners();
  }
}
