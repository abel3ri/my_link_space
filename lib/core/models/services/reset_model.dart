import 'dart:convert';
import 'package:http/http.dart' as http;

class ResetModel {
  static const String baseUrl =
      'https://192.168.1.108:8000'; // Replace with your API URL

  Future<Map<String, dynamic>> forgotPassword(String email) async {
    final response = await http.post(
      Uri.parse('$baseUrl/forgot-password'),
      body: jsonEncode({'email': email}),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to send password reset code');
    }
  }

  Future<Map<String, dynamic>> verifyCode(String email, String code) async {
    final response = await http.post(
      Uri.parse('$baseUrl/verify-code'),
      body: jsonEncode({'email': email, 'code': code}),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to verify the code');
    }
  }

  Future<Map<String, dynamic>> resetPassword(
      String email, String code, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/reset-password'),
      body: jsonEncode({
        'email': email,
        'code': code,
        'password': password,
        'password_confirmation': password,
      }),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to reset password');
    }
  }
}
