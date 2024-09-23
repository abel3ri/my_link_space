import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SignUpvm extends ChangeNotifier {
  final formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController confirmcontroller = TextEditingController();

  bool _isLoading = false;
  bool _isSuccess = false;
  bool _emailInUse = false;
  String? _emailError;

  bool get isLoading => _isLoading;
  bool get isSuccess => _isSuccess;
  bool get emailInUse => _emailInUse;
  String? get emailError => _emailError;

  final storage = const FlutterSecureStorage();

  Future<void> storeUserName(String name) async {
    await storage.write(key: 'userName', value: name);
  }

  Future<String?> getUserName() async {
    return await storage.read(key: 'userName');
  }

  Future<void> storeToken(String token) async {
    await storage.write(key: 'userToken', value: token);
  }

  Future<void> register() async {
    if (formKey.currentState!.validate()) {
      _setLoading(true);
      final url = Uri.parse('http://192.168.1.108:8000/api/register/');

      try {
        final response = await http.post(
          url,
          headers: <String, String>{
            'Content-Type': 'application/json',
            'Accept': 'application/json',
          },
          body: jsonEncode(<String, String>{
            'name': nameController.text,
            'email': emailController.text,
            'password': passwordController.text,
            'password_confirmation': confirmcontroller.text,
          }),
        );

        if (response.statusCode == 201) {
          final token = jsonDecode(response.body)['token'];
          await storeToken(token);
          await storeUserName(nameController.text);
          _setSuccess(true);
          _setEmailInUse(false);
        } else if (response.statusCode == 422) {
          final error = jsonDecode(response.body);
          if (error['errors']?['email'] != null) {
            setEmailError('The email has already been taken.');
          }
          _setSuccess(false);
        } else {
          throw Exception('Failed to sign up: ${response.body}');
        }
      } catch (e) {
        _setSuccess(false);
        throw Exception('Error: $e');
      } finally {
        _setLoading(false);
      }
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

  void _setEmailInUse(bool value) {
    _emailInUse = value;
    notifyListeners();
  }

  void setEmailError(String? error) {
    _emailError = error;
    notifyListeners();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
    super.dispose();
  }
}
