import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class VerifyCodeViewModel with ChangeNotifier {
  String email = '';
  String code = '';
  bool isLoading = false;

  Future<void> verifyCode() async {
    isLoading = true;
    notifyListeners();

    final url = Uri.parse('http://192.168.1.108:8000/api/auth/verify-code-f');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: '{"email": "$email", "code": "$code"}',
    );

    isLoading = false;
    if (response.statusCode == 200) {
    } else {}
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
