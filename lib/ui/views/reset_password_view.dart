import 'package:flutter/material.dart';
import 'package:my_link_space/core/view_models/reset_view_model.dart';
import 'package:provider/provider.dart';

class ResetPasswordPage extends StatelessWidget {
  final String email;
  final String code;

  // Controllers for password input fields
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  ResetPasswordPage({required this.email, required this.code});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Reset Password')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Consumer<ForgotPasswordViewModel>(
          builder: (context, viewModel, child) {
            return Column(
              children: [
                // Password TextField
                TextField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(labelText: 'New Password'),
                ),
                const SizedBox(height: 16),

                // Confirm Password TextField
                TextField(
                  controller: _confirmPasswordController,
                  obscureText: true,
                  decoration:
                      const InputDecoration(labelText: 'Confirm New Password'),
                ),
                const SizedBox(height: 24),

                // Show a loader when the viewModel is in loading state
                viewModel.isLoading
                    ? const CircularProgressIndicator()
                    : ElevatedButton(
                        onPressed: () async {
                          final password = _passwordController.text;
                          final confirmPassword =
                              _confirmPasswordController.text;

                          // Validate that both password fields are not empty and match
                          if (password.isNotEmpty &&
                              confirmPassword.isNotEmpty) {
                            if (password == confirmPassword) {
                              // Trigger the ViewModel's password reset method
                              await viewModel.resetPassword(
                                  email, code, password);

                              if (viewModel.errorMessage != null) {
                                // Show error message if password reset fails
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      content: Text(viewModel.errorMessage!)),
                                );
                              } else {
                                // If successful, show success message and possibly navigate to login
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content:
                                          Text('Password reset successful!')),
                                );

                                // Optionally navigate to login screen after password reset
                                Navigator.of(context)
                                    .popUntil((route) => route.isFirst);
                              }
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text('Passwords do not match')),
                              );
                            }
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('Please enter the password')),
                            );
                          }
                        },
                        child: const Text('Reset Password'),
                      ),
              ],
            );
          },
        ),
      ),
    );
  }
}
