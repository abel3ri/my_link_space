import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class VerifyCodeViewModel with ChangeNotifier {
  String email = '';
  String code = '';
  bool isLoading = false;
  String errorMessage = '';
  String successMessage = '';

  Future<void> verifyCode(BuildContext context) async {
    isLoading = true;
    notifyListeners();

    final url = Uri.parse('http://192.168.1.108:8000/api/auth/verify-code-f');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'email': email, 'code': code}),
    );

    isLoading = false;
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      successMessage =
          data['message'] ?? 'Code verified! Proceed to reset password.';

      // Navigate to reset password page upon successful verification
      Navigator.pushNamed(context, '/reset-password', arguments: {
        'email': email,
        'code': code, // You may pass the code/token if needed
      });
    } else {
      final errorData = jsonDecode(response.body);
      errorMessage =
          errorData['error'] ?? 'Code verification failed. Please try again.';
    }
    notifyListeners();
  }

  void setEmail(String value) {
    email = value;
    notifyListeners();
  }

  void setCode(String value) {
    code = value;
    notifyListeners();
  }
}
