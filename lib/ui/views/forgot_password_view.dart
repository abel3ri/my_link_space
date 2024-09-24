import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:my_link_space/core/view_models/forgot_view_model.dart';
import 'package:my_link_space/ui/shared/components/colors.dart';
import 'package:my_link_space/ui/shared/components/fonts.dart';
import 'package:my_link_space/ui/shared/widget/form.dart';
import 'package:my_link_space/ui/views/Reset_password_page.dart';
import 'package:provider/provider.dart';

class ForgotPassword extends StatelessWidget {
  ForgotPassword({super.key});

  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kfield_back,
        body: Consumer<ForgotPasswordViewModel>(builder:
            (BuildContext context, ForgotPasswordViewModel forgotPVm, child) {
          return SingleChildScrollView(
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
                    ],
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0, left: 20),
                  child: Text(
                    'Forgot Password',
                    style: CustomTextStyles.D1,
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                CustomField(
                  onChanged: forgotPVm.setemail,
                  controller: emailController,
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
                const SizedBox(height: 16),
                forgotPVm.isLoading
                    ? Center(
                        child: AlertDialog(
                            backgroundColor: kbutton_finall1,
                            title: Center(
                              child: Text(
                                'Please wait',
                                style: CustomTextStyles.B1,
                              ),
                            )),
                      )
                    : Padding(
                        padding: const EdgeInsets.only(left: 18.0),
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(kbutton_finall1),
                          ),
                          onPressed: () async {
                            final email = emailController.text;
                            if (email.isNotEmpty) {
                              await forgotPVm.requestPasswordReset(email);
                              if (forgotPVm.errorMessage != null) {
                                ScaffoldMessenger.of(context)
                                    .showMaterialBanner(MaterialBanner(
                                        content: Text(
                                          (forgotPVm.errorMessage!),
                                          style: CustomTextStyles.B2,
                                        ),
                                        padding: EdgeInsets.all(20),
                                        shadowColor: const Color.fromARGB(
                                            255, 230, 10, 10),
                                        backgroundColor: kfield_back,
                                        actions: <Widget>[
                                      TextButton(
                                          onPressed:
                                              ScaffoldMessenger.of(context)
                                                  .hideCurrentMaterialBanner,
                                          child: Icon(FontAwesomeIcons.close))
                                    ]));
                              } else {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => ResetPasswordPage(),
                                  ),
                                );
                              }
                            }
                          },
                          child: SizedBox(
                            height: 50,
                            width: 320,
                            child: Center(
                              child: Text(
                                'Send Reset Code',
                                style: CustomTextStyles.B1,
                              ),
                            ),
                          ),
                        ),
                      ),
                const SizedBox(
                  height: 40,
                ),
                Center(
                  child: GestureDetector(
                    onTap: () {
                      context.go('/login');
                    },
                    child: RichText(
                        text: TextSpan(
                            text: 'Back to ',
                            style: CustomTextStyles.B12,
                            children: [
                          TextSpan(
                            text: 'Sign In',
                            style: CustomTextStyles.B12.copyWith(
                              color: kbutton_finall1,
                            ),
                          ),
                        ])),
                  ),
                )
              ],
            ),
          );
        }));
  }
}
