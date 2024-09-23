import 'dart:convert';
import 'package:http/http.dart' as http;

class AuthService {
  final String baseUrl = 'http://192.168.1.108:8000';

  Future<Map<String, dynamic>> register(
      String name, String email, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/register'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'name': name, 'email': email, 'password': password}),
    );
    return jsonDecode(response.body);
  }

  Future<Map<String, dynamic>> login(String email, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/login'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'email': email, 'password': password}),
    );
    return jsonDecode(response.body);
  }

  Future<Map<String, dynamic>> googleSignIn(String accessToken) async {
    final response = await http.post(
      Uri.parse('$baseUrl/google-signin'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'access_token': accessToken}),
    );
    return jsonDecode(response.body);
  }

  Future<Map<String, dynamic>> facebookSignIn(String accessToken) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/facebook-signin'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $accessToken',
        },
        body: jsonEncode({'accessToken': accessToken}),
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        return {
          'error':
              'Failed to authenticate with the backend: ${response.statusCode}'
        };
      }
    } catch (e) {
      return {'error': e.toString()};
    }
  }
}
