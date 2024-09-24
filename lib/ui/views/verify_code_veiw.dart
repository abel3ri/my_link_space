import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:my_link_space/core/view_models/reset_password_view_model.dart';
import 'package:my_link_space/ui/shared/components/colors.dart';
import 'package:my_link_space/ui/shared/components/fonts.dart';
import 'package:my_link_space/ui/shared/widget/form.dart';
import 'package:provider/provider.dart';

class SetPasswordView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<ResetPasswordViewModel>(context);

    final TextEditingController emailController = TextEditingController();

    final TextEditingController _passwordController = TextEditingController();
    final TextEditingController _confirmPasswordController =
        TextEditingController();
    return Scaffold(
      backgroundColor: kfield_back,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 88.0, left: 20),
              child: Row(
                children: [
                  Text(
                    'MyLinkSpace',
                    style: CustomTextStyles.title1,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  SvgPicture.asset(
                    'assets/images/token_spaces.svg',
                    width: 40,
                    height: 40,
                  ),
                  const SizedBox(
                    width: 150,
                  ),
                  GestureDetector(
                    onTap: () {
                      context.go('/login');
                    },
                    child: const Icon(
                      Icons.navigate_before,
                      color: kbackground1,
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0, left: 20),
              child: Text(
                "Reset Password",
                style: CustomTextStyles.D1,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  CustomField(
                    onChanged: viewModel.setEmail,
                    controller: emailController,
                    hintText: 'Email',
                    validator: (String? email) {},
                  ),
                  CustomField(
                    onChanged: viewModel.setToken,
                    controller: _passwordController,
                    hintText: 'New password',
                    validator: (String? email) {},
                  ),
                  CustomField(
                    onChanged: viewModel.setPasswordConfirmation,
                    controller: _confirmPasswordController,
                    hintText: 'Confirm password',
                    validator: (String? email) {},
                  ),
                  const SizedBox(height: 20),
                  viewModel.isLoading
                      ? AlertDialog(
                          backgroundColor: kbutton_finall1,
                          title: Center(
                            child: Text(
                              'Please wait',
                              style: CustomTextStyles.B1,
                            ),
                          ))
                      : ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(kbutton_finall1),
                          ),
                          onPressed: () {
                            viewModel.resetPassword();
                          },
                          child: SizedBox(
                            height: 50,
                            width: 320,
                            child: Center(
                                child: Text(
                              "Reset Password",
                              style: CustomTextStyles.B1,
                            )),
                          ),
                        ),
                  const SizedBox(height: 20),
                  Text(
                    viewModel.message,
                    style: const TextStyle(color: Colors.red),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
