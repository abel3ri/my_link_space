import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

enum ViewState { idle, busy, error, success }

class LogInViewModel extends ChangeNotifier {
  ViewState _state = ViewState.idle;
  ViewState get state => _state;

  String _message = '';
  String get message => _message;

  bool get isLoading => _state == ViewState.busy;
  bool get isSuccess => _state == ViewState.success;

  final formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final FlutterSecureStorage email = const FlutterSecureStorage();

  void _setState(ViewState state) {
    _state = state;
    notifyListeners();
  }

  void _setMessage(String msg) {
    _message = msg;
    notifyListeners();
  }

  Future<void> storeToken(String token) async {
    await email.write(key: 'userToken', value: token);
  }

  Future<String?> getToken() async {
    return await email.read(key: 'userToken');
  }

  Future<void> signin(BuildContext context) async {
    if (formKey.currentState?.validate() != true) {
      _setMessage('Form is invalid');
      return;
    }

    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      _setMessage('Email and Password cannot be empty.');
      return;
    }

    _setState(ViewState.busy);

    final url = Uri.parse('http://192.168.200.35:8000/api/login/');
    final body = jsonEncode({
      'email': email,
      'password': password,
    });

    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: body,
      );

      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);
        final name = jsonResponse['user']['name'];
        final token = jsonResponse['token'];
        await storeToken(token);

        _setMessage("Login successful");
        _setState(ViewState.success);

        context.go('/link', extra: name);
      } else {
        final errorResponse = jsonDecode(response.body);
        _setMessage(errorResponse['message'] ?? 'Login failed');
        _setState(ViewState.error);
      }
    } catch (e) {
      _setMessage("An error occurred: $e");
      _setState(ViewState.error);
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
