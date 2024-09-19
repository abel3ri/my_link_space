import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUpvm extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();

  Future<void> register() async {
    if (formKey.currentState!.validate()) {
      try {
        UserCredential userCredential =
            await _auth.createUserWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );

        print("User registered: ${userCredential.user?.email}");
      } catch (e) {
        print("Error: $e");
      }
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    usernameController.dispose();
    super.dispose();
  }
}
