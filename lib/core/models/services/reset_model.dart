import 'dart:convert';
import 'package:http/http.dart' as http;

class ResetModel {
  static const String baseUrl = 'http://192.168.1.108:8000/api/auth';

  Future<Map<String, dynamic>> forgotPassword(String email) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/forgot-password'),
        body: jsonEncode({'email': email}),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        return {'error': 'Failed to send password reset code. Try again.'};
      }
    } catch (e) {
      return {
        'error': 'Error: ${e.toString()}',
      };
    }
  }

  Future<Map<String, dynamic>> verifyCode(String email, String code) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/verify-code'),
        body: jsonEncode({'email': email, 'code': code}),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        return {'error': 'Invalid or expired verification code.'};
      }
    } catch (e) {
      return {
        'error': 'Error: ${e.toString()}',
      };
    }
  }

  Future<Map<String, dynamic>> resetPassword(
      String email, String code, String password) async {
    try {
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
        return {'error': 'Failed to reset password. Please try again.'};
      }
    } catch (e) {
      return {
        'error': 'Error: ${e.toString()}',
      };
    }
  }
}
