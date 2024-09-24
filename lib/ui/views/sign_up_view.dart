import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:my_link_space/core/view_models/sign_upvm.dart';
import 'package:my_link_space/ui/shared/components/button.dart';
import 'package:my_link_space/ui/shared/components/colors.dart';
import 'package:my_link_space/ui/shared/components/fonts.dart';
import 'package:my_link_space/ui/shared/widget/form.dart';
import 'package:provider/provider.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kfield_back,
      body: Consumer<SignUpvm>(
        builder: (context, signUpVm, child) {
          if (signUpVm.isLoading) {
            return Center(
              child: AlertDialog(
                  backgroundColor: kbutton_finall1,
                  title: Center(
                    child: Text(
                      'Please wait',
                      style: CustomTextStyles.B1,
                    ),
                  )),
            );
          } else if (signUpVm.isSuccess) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              ScaffoldMessenger.of(context).showMaterialBanner(MaterialBanner(
                  content: Text(
                    'Congra! Registerd successfully',
                    style: CustomTextStyles.B2,
                  ),
                  padding: const EdgeInsets.all(20),
                  shadowColor: Colors.greenAccent,
                  backgroundColor: kfield_back,
                  actions: <Widget>[
                    TextButton(
                        onPressed: ScaffoldMessenger.of(context)
                            .hideCurrentMaterialBanner,
                        child: const Icon(FontAwesomeIcons.close))
                  ]));
              context.go('/login');
            });
            return const SizedBox.shrink();
          } else {
            return _buildSignUpForm(context, signUpVm);
          }
        },
      ),
    );
  }

  Widget _buildSignUpForm(BuildContext context, SignUpvm signUpVm) {
    return ListView(
      padding: const EdgeInsets.all(8.0),
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 88.0, left: 0),
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
        const SizedBox(height: 40),
        Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: Text('Join MyLinkSpace 🎉', style: CustomTextStyles.D1),
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: Text('Sign Up for free!', style: CustomTextStyles.L1),
        ),
        const SizedBox(height: 20.0),
        Form(
          key: signUpVm.formKey,
          child: Column(
            children: [
              CustomField(
                onChanged: () {},
                controller: signUpVm.nameController,
                hintText: '@mylink.space/name',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a name';
                  }
                  return null;
                },
              ),
              CustomField(
                onChanged: (value) {
                  if (signUpVm.emailError != null) {
                    signUpVm.setEmailError(null);
                  }
                },
                controller: signUpVm.emailController,
                hintText: 'email',
                validator: (value) {
                  if (value == null || value.isEmpty || !value.contains('@')) {
                    return 'Please enter a valid email';
                  }
                  return null;
                },
              ),
              CustomField(
                onChanged: () {},
                controller: signUpVm.passwordController,
                hintText: 'password',
                isobsecuretext: true,
                validator: (value) {
                  if (value == null || value.isEmpty || value.length < 6) {
                    return 'Password must be at least 6 characters long';
                  }
                  return null;
                },
              ),
              CustomField(
                onChanged: () {},
                controller: signUpVm.confirmcontroller,
                hintText: 'confirm password',
                isobsecuretext: true,
                sfx_icon: const Icon(
                  Icons.visibility_outlined,
                  color: kbackground1,
                  size: 30,
                ),
                validator: (value) {
                  if (value == null ||
                      value != signUpVm.passwordController.text) {
                    return 'Passwords do not match';
                  }
                  return null;
                },
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: MAterialBtn(
            onTap: () async {
              if (signUpVm.formKey.currentState != null &&
                  signUpVm.formKey.currentState!.validate()) {
                await signUpVm.register();

                if (signUpVm.isSuccess) {
                } else if (signUpVm.emailInUse) {
                  ScaffoldMessenger.of(context)
                      .showMaterialBanner(MaterialBanner(
                          content: Text(
                            'Email is already in use',
                            style: CustomTextStyles.B2,
                          ),
                          padding: const EdgeInsets.all(20),
                          shadowColor: const Color.fromARGB(255, 230, 10, 10),
                          backgroundColor: kfield_back,
                          actions: <Widget>[
                        TextButton(
                            onPressed: ScaffoldMessenger.of(context)
                                .hideCurrentMaterialBanner,
                            child: const Icon(FontAwesomeIcons.close))
                      ]));
                } else {
                  ScaffoldMessenger.of(context)
                      .showMaterialBanner(MaterialBanner(
                          content: Text(
                            'Email is already in use',
                            style: CustomTextStyles.B2,
                          ),
                          padding: const EdgeInsets.all(20),
                          shadowColor: const Color.fromARGB(255, 230, 10, 10),
                          backgroundColor: kfield_back,
                          actions: <Widget>[
                        TextButton(
                            onPressed: ScaffoldMessenger.of(context)
                                .hideCurrentMaterialBanner,
                            child: const Icon(FontAwesomeIcons.close))
                      ]));
                }
              }
            },
            colors: kbutton_finall1,
            ttile: 'Create Account',
            width: 370,
            height: 55,
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 25.0),
          child: RichText(
            text: TextSpan(
              text: 'By clicking ',
              style: CustomTextStyles.B12,
              children: [
                TextSpan(
                  text: 'Create account',
                  style: CustomTextStyles.B12.copyWith(
                    color: const Color.fromARGB(255, 18, 19, 20),
                  ),
                ),
                TextSpan(
                  text: ' ,you agree to MyLinkSpace\'s ',
                  style: CustomTextStyles.B12,
                ),
                TextSpan(
                  text: ' privacy  notice , T&Cs',
                  style: CustomTextStyles.B12.copyWith(
                    decoration: TextDecoration.underline,
                    color: const Color.fromARGB(255, 80, 164, 232),
                  ),
                ),
                TextSpan(
                  text: ' and to recievw offers, news and updates',
                  style: CustomTextStyles.B12,
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 20),
        Center(
          child: Text('OR', style: CustomTextStyles.B12),
        ),
        // const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.only(left: 15.0),
          child: Column(
            children: [
              GoogleSignupPage(),
              const SizedBox(height: 5),
              const FacebookSignupPage(),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  context.go('/login');
                },
                child: RichText(
                  text: TextSpan(
                    text: 'Already have an account? ',
                    style: CustomTextStyles.B12,
                    children: [
                      TextSpan(
                        text: 'sign in',
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
    );
  }
}
