import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ResetPasswordViewModel extends ChangeNotifier {
  bool isLoading = false;
  String message = '';
  bool isError = false; // New property to track error state
  String email = '';
  String password = '';
  String passwordConfirmation = '';
  String token = '';

  // Setters to update the fields
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

  // Method to reset the password
  Future<void> resetPassword() async {
    if (password != passwordConfirmation) {
      message = "Passwords do not match.";
      isError = true; // Set isError to true
      notifyListeners();
      return;
    }

    isLoading = true;
    message = ''; // Clear previous messages
    notifyListeners();

    try {
      final response = await http.post(
        Uri.parse('http://192.168.200.35:8000/api/auth/reset-password/'),
        body: jsonEncode({
          'email': email,
          'code':
              token, // The code or token sent to the email for password reset
          'password': password,
          'password_confirmation': passwordConfirmation,
        }),
        headers: {'Content-Type': 'application/json'},
      );

      final responseData = jsonDecode(response.body);

      if (response.statusCode == 422) {
        // Validation errors from the backend
        String errorMessages = '';
        if (responseData['errors'] != null) {
          responseData['errors'].forEach((field, errors) {
            errorMessages += '$field: ${errors.join(', ')}\n';
          });
        }
        message = errorMessages.isNotEmpty
            ? 'Validation failed:\n$errorMessages'
            : 'Validation failed. Please check your input.';
        isError = true; // Set isError to true
      } else if (response.statusCode == 200 &&
          responseData['status'] == 'success') {
        // If password reset is successful
        message = 'Password reset successfully!';
        isError = false; // Set isError to false since it is a success
        token = ''; // Clear the token locally after a successful reset
      } else {
        // Handle other failure scenarios
        message = responseData['message'] ??
            'Failed to reset password. Please try again.';
        isError = true; // Set isError to true
      }
    } catch (e) {
      message = 'Error: ${e.toString()}';
      isError = true; // Set isError to true
    }

    isLoading = false;
    notifyListeners();
  }
}
