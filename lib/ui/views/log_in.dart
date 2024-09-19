import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:my_link_space/core/view_model/log_in_view_model.dart';
import 'package:my_link_space/core/view_model/service_view_model.dart';
import 'package:my_link_space/ui/shared/components/button.dart';
import 'package:my_link_space/ui/shared/components/colors.dart';
import 'package:my_link_space/ui/shared/components/fonts.dart';
import 'package:my_link_space/ui/shared/widget/form.dart';
import 'package:my_link_space/ui/views/splash_screen.dart';
import 'package:provider/provider.dart';

class LogIn extends StatefulWidget {
  LogIn({super.key});
  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final logInViewModel = Provider.of<LogInViewModel>(context, listen: false);
    final authViewModel = Provider.of<AuthViewModel>(context, listen: false);

    return Provider<LogInViewModel>(
        create: (_) => LogInViewModel(),
        // we use `builder` to obtain a new `BuildContext` that has access to the provider
        builder: (context, child) {
          // No longer throws
          return Scaffold(
              backgroundColor: kfield_back,
              body: SingleChildScrollView(
                  child: Form(
                      key: _formKey, // Form for validation
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 88.0, left: 20),
                              child: Row(
                                children: [
                                  Text(
                                    'MyLinkSpace',
                                    style: CustomTextStyles.title1,
                                  ),
                                  const SizedBox(width: 10),
                                  SvgPicture.asset(
                                    'assets/images/token_spaces.svg',
                                    width: 40,
                                    height: 40,
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 20.0, left: 20),
                              child: Text(
                                'Welcome Back!',
                                style: CustomTextStyles.D1,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Padding(
                              padding: const EdgeInsets.only(left: 20.0),
                              child: Text(
                                'Sign Up for free!',
                                style: CustomTextStyles.L1,
                              ),
                            ),
                            const SizedBox(height: 10),

                            // Email field
                            CustomField(
                              controller: logInViewModel.emailController,
                              hintText: 'email',
                              validator: (value) {
                                if (value == null ||
                                    value.isEmpty ||
                                    !value.contains('@')) {
                                  return 'Please enter a valid email';
                                }
                                return null;
                              },
                            ),
                            CustomField(
                              controller: logInViewModel.passwordController,
                              hintText: 'password',
                              isobsecuretext: true,
                              sfx_icon: const Icon(Icons.visibility_outlined),
                              validator: (value) {
                                if (value == null ||
                                    value.isEmpty ||
                                    value.length < 6) {
                                  return 'Password must be at least 6 characters long';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 10),
                            Padding(
                              padding: const EdgeInsets.only(left: 250.0),
                              child: GestureDetector(
                                onTap: () {
                                  context.go('/forgot');
                                },
                                child: Text(
                                  'Forgot password?',
                                  style: CustomTextStyles.B12
                                      .copyWith(color: kbutton_finall1),
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),

                            // Loading state or login button
                            if (logInViewModel.state == ViewState.busy)
                              const SplashScreen()
                            else
                              Padding(
                                padding: const EdgeInsets.only(left: 15.0),
                                child: MAterialBtn(
                                  width: 370,
                                  height: 55,
                                  onTap: () async {
                                    if (_formKey.currentState!.validate()) {
                                      final email =
                                          logInViewModel.emailController.text;
                                      final password = logInViewModel
                                          .passwordController.text;

                                      // Call signInUser, which returns a bool, not void
                                      bool result = await authViewModel
                                          .signInUser(email, password);

                                      if (result) {
                                        // If sign-in is successful, navigate to home
                                        context.go(
                                            '/homeview'); // This returns void, but you're using it correctly
                                      } else {
                                        // Handle login error
                                        showDialog(
                                          context: context,
                                          builder: (context) => AlertDialog(
                                            // backgroundColor: ,
                                            actions: [
                                              Align(
                                                alignment: Alignment.topRight,
                                                child: TextButton(
                                                  onPressed: () {
                                                    Navigator.of(context).pop();
                                                  },
                                                  child: const CircleAvatar(
                                                    backgroundColor: khint,
                                                    child: const Center(
                                                      child: Icon(
                                                        Icons.close,
                                                        color: kfield_back,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              )
                                            ],
                                            title: Text('Login Failed'),
                                            content: Text(
                                                'Please check your credentials.'),
                                          ),
                                        );
                                      }
                                    }
                                  },
                                  ttile: 'Log in',
                                  colors: kbutton_finall1,
                                ),
                              ),

                            const SizedBox(
                              height: 20,
                            ),
                            Center(
                              child: Text(
                                'OR',
                                style: CustomTextStyles.B12,
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Padding(
                                padding: const EdgeInsets.only(left: 15.0),
                                child: Column(
                                  children: [
                                    Material2Btn(
                                      text: 'Sign up with Google',
                                      images: 'assets/images/g.png',
                                      onTap: () {
                                        context.go('/homeview');
                                      },
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    Material2Btn(
                                      text: 'Sign up with Facebook',
                                      images:
                                          'assets/images/facebook-icon-logo-205182.png',
                                      onTap: () {},
                                    ),
                                    const SizedBox(
                                      height: 40,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        context.go('/signup');
                                      },
                                      child: RichText(
                                          text: TextSpan(
                                              text: 'Don\'t have an account? ',
                                              style: CustomTextStyles.B12,
                                              children: [
                                            TextSpan(
                                              text: 'sign up',
                                              style:
                                                  CustomTextStyles.B12.copyWith(
                                                color: kbutton_finall1,
                                              ),
                                            ),
                                          ])),
                                    )
                                  ],
                                ))
                          ]))));
        });
  }
}
