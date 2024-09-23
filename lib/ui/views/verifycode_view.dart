import 'package:flutter/material.dart';
import 'package:my_link_space/core/view_models/reset_view_model.dart';
import 'package:my_link_space/ui/views/reset_password_view.dart';
import 'package:provider/provider.dart';

class VerifyCodePage extends StatelessWidget {
  final String email;
  final TextEditingController _codeController = TextEditingController();

  VerifyCodePage({required this.email});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Verify Code')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Consumer<ForgotPasswordViewModel>(
          builder: (context, viewModel, child) {
            return Column(
              children: [
                TextField(
                  controller: _codeController,
                  decoration:
                      const InputDecoration(labelText: 'Verification Code'),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 16),
                viewModel.isLoading
                    ? const CircularProgressIndicator()
                    : ElevatedButton(
                        onPressed: () async {
                          final code = _codeController.text;
                          if (code.isNotEmpty) {
                            await viewModel.verifyCode(email, code);
                            if (viewModel.errorMessage != null) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                    content: Text(viewModel.errorMessage!)),
                              );
                            } else {
                              // Navigate to the reset password page
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => ResetPasswordPage(
                                      email: email, code: code),
                                ),
                              );
                            }
                          }
                        },
                        child: const Text('Verify Code'),
                      ),
              ],
            );
          },
        ),
      ),
    );
  }
}
