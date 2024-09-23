import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:my_link_space/ui/shared/components/button.dart';
import 'package:my_link_space/ui/shared/components/colors.dart';
import 'package:my_link_space/ui/shared/components/fonts.dart';
import 'package:my_link_space/ui/shared/widget/form.dart';

class ForgotPassword extends StatelessWidget {
  ForgotPassword({super.key});

  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
                onChanged: () {},
                controller: controller,
                hintText: 'email',
                validator: (value) {
                  if (value == null || value.isEmpty || !value.contains('@')) {
                    return 'Please enter a valid email';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: MAterialBtn(
                  width: 370,
                  height: 55,
                  onTap: () {
                    context.go('/login');
                  },
                  ttile: 'Reset Password',
                  colors: kbutton_finall1,
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
        ));
  }
}
