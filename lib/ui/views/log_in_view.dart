import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:my_link_space/core/models/google_auth_model.dart';
import 'package:my_link_space/core/view_models/log_in_view_model.dart';
import 'package:my_link_space/ui/shared/components/button.dart';
import 'package:my_link_space/ui/shared/components/colors.dart';
import 'package:my_link_space/ui/shared/components/fonts.dart';
import 'package:my_link_space/ui/shared/widget/form.dart';
import 'package:my_link_space/ui/shared/widget/loading.dart';
import 'package:provider/provider.dart';
import 'package:redacted/redacted.dart';

class LogIn extends StatefulWidget {
  LogIn({super.key});

  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final googleSignInModel =
          Provider.of<GoogleSignInModel>(context, listen: false);
      googleSignInModel.getStoredEmail().then((email) {
        if (email != null) {
          print("Last registered email: $email");
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<LogInViewModel>(
      create: (_) => LogInViewModel(),
      builder: (context, child) {
        final logInViewModel = Provider.of<LogInViewModel>(context);

        return Scaffold(
          backgroundColor: kfield_back,
          body: SingleChildScrollView(
              child: Form(
            key: logInViewModel.formKey,
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
                  padding: const EdgeInsets.only(top: 20.0, left: 20),
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
                CustomField(
                  onChanged: () {},
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
                  onChanged: () {},
                  controller: logInViewModel.passwordController,
                  hintText: 'password',
                  isobsecuretext: true,
                  sfx_icon: const Icon(Icons.visibility_outlined),
                  validator: (value) {
                    if (value == null || value.isEmpty || value.length < 6) {
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
                      style:
                          CustomTextStyles.B12.copyWith(color: kbutton_finall1),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                if (logInViewModel.state == ViewState.busy)
                  const Loading().redacted(
                    context: context,
                    redact: true,
                    configuration: RedactedConfiguration(
                      animationDuration:
                          const Duration(milliseconds: 800), //default
                    ),
                  )
                else
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: MAterialBtn(
                      width: 370,
                      height: 55,
                      onTap: () async {
                        print("Login button tapped");

                        await logInViewModel.signin(context);

                        if (mounted && logInViewModel.isSuccess) {
                          context.go(
                              '/link'); // Navigate to the link page after success
                        } else if (mounted) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(logInViewModel.message.isEmpty
                                  ? 'Login Failed'
                                  : logInViewModel.message),
                            ),
                          );
                        }
                      },
                      ttile: 'Log in',
                      colors: kbutton_finall1,
                    ),
                  ),
                const SizedBox(height: 20),
                Center(
                  child: Text(
                    'OR',
                    style: CustomTextStyles.B12,
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: Column(
                    children: [
                      GoogleSignupPage(),
                      const SizedBox(height: 5),
                      const FacebookSignupPage(),
                      const SizedBox(height: 40),
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
                                style: CustomTextStyles.B12.copyWith(
                                  color: kbutton_finall1,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ).redacted(
            context: context,
            redact: true,
            configuration: RedactedConfiguration(
              animationDuration: const Duration(milliseconds: 800), //default
            ),
          )),
        );
      },
    );
  }
}
