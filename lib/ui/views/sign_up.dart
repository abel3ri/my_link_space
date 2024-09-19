import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:my_link_space/core/view_model/service_view_model.dart';
import 'package:my_link_space/core/view_model/sign_upvm.dart';
import 'package:my_link_space/ui/shared/components/button.dart';
import 'package:my_link_space/ui/shared/components/colors.dart';
import 'package:my_link_space/ui/shared/components/fonts.dart';
import 'package:my_link_space/ui/shared/widget/form.dart';
import 'package:provider/provider.dart';

class SignUp extends StatelessWidget {
  final SignUpvm viewModel = SignUpvm();
  @override
  Widget build(BuildContext context) {
    final authviewModel = Provider.of<AuthViewModel>(context);

    return AnimatedBuilder(
        animation: SignUpvm(),
        builder: (context, child) {
          return Scaffold(
            backgroundColor: kfield_back,
            body: CustomScrollView(
              slivers: [
                SliverPadding(
                  padding: const EdgeInsets.all(8.0),
                  sliver: SliverList(
                    delegate: SliverChildListDelegate(
                      [
                        Padding(
                          padding: const EdgeInsets.only(top: 88.0, left: 0),
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
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Text(
                            'Join MyLinkSpace',
                            style: CustomTextStyles.D1,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Text(
                            'Sign Up for free!',
                            style: CustomTextStyles.L1,
                          ),
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        Form(
                          key: viewModel.formKey,
                          child: Column(
                            children: [
                              CustomField(
                                controller: viewModel.usernameController,
                                hintText: '@mylink.space/username',
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter a username';
                                  }
                                  return null;
                                },
                              ),
                              CustomField(
                                controller: viewModel.emailController,
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
                                controller: viewModel.passwordController,
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
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15.0),
                          child: MAterialBtn(
                            ttile: 'Create Account',
                            colors: kbutton_finall1,
                            width: 370,
                            height: 55,
                            onTap: () async {
                              await viewModel.register();

                              if (viewModel.formKey.currentState!.validate()) {
                                await viewModel.register();
                                context.go('/login');
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('Registration Failed'),
                                  ),
                                );
                              }
                            },
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
                                    color:
                                        const Color.fromARGB(255, 18, 19, 20),
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
                                    color:
                                        const Color.fromARGB(255, 80, 164, 232),
                                  ),
                                ),
                                TextSpan(
                                  text:
                                      ' and to recievw offers, news and updates',
                                  style: CustomTextStyles.B12,
                                ),
                              ],
                            ),
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
                                  context.go('/login');
                                },
                                child: RichText(
                                    text: TextSpan(
                                        text: 'Already have an account? ',
                                        style: CustomTextStyles.B12,
                                        children: [
                                      TextSpan(
                                        text: 'Sign in',
                                        style: CustomTextStyles.B12.copyWith(
                                          color: kbutton_finall1,
                                        ),
                                      ),
                                    ])),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }
}
