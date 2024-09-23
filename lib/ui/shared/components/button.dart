import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:my_link_space/core/models/services/authservice.dart';
import 'package:my_link_space/core/view_models/email_verification_view_model.dart';
import 'package:my_link_space/ui/shared/components/colors.dart';
import 'package:my_link_space/ui/shared/components/fonts.dart';
import 'package:provider/provider.dart';

class MAterialBtn extends StatelessWidget {
  MAterialBtn(
      {super.key,
      required this.width,
      required this.onTap,
      required this.ttile,
      required this.height,
      required this.colors});
  VoidCallback onTap;
  final double width;
  final String ttile;
  final double height;
  final Color colors;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(30.2)),
          color: kbutton_finall1,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(width: 5),
            Text(
              ttile,
              style: CustomTextStyles.B1,
            ),
          ],
        ),
      ),
    );
  }
}

class GoogleSignupPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Provider.of<GoogleSignupViewModel>(context);

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Consumer<GoogleSignupViewModel>(
        builder: (context, viewModel, child) {
          return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (viewModel.isLoading)
                  CircularProgressIndicator()
                else ...[
                  if (viewModel.message.isNotEmpty)
                    Text(
                      viewModel.message,
                      style: TextStyle(
                        color: viewModel.state == SignupState.error
                            ? Colors.red
                            : Colors.green,
                        fontSize: 16,
                      ),
                    ),
                  SizedBox(height: 16),
                  ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.all(kfield_back),
                        textStyle: WidgetStateProperty.all(CustomTextStyles.D2),
                      ),
                      onPressed: () {
                        viewModel.pickAccount();
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 50,
                            width: 50,
                            child: Image.asset('assets/images/g.png'),
                          ),
                          const SizedBox(width: 10),
                          Text(
                            'Sign In with Google',
                            style: CustomTextStyles.B2,
                          ),
                        ],
                      ))
                ]
              ]);
        },
      ),
    );
  }
}

class FacebookSignupPage extends StatelessWidget {
  const FacebookSignupPage({super.key});

  Future<void> _handleFacebookSignIn(BuildContext context) async {
    try {
      final LoginResult result = await FacebookAuth.instance.login();

      if (result.status == LoginStatus.success) {
        final viewModel = Provider.of<AuthService>(context, listen: false);
        //  viewModel.facebookSignUpOrLogin(accessToken.token);
      } else if (result.status == LoginStatus.cancelled) {
        print('Facebook Sign-In Cancelled');
      } else {
        print('Facebook Sign-In Error: ${result.message}');
      }
    } catch (error) {
      print('Facebook Sign-In Error: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<AuthService>(context);

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all(kfield_back),
              textStyle: WidgetStateProperty.all(CustomTextStyles.D2),
            ),
            onPressed: viewModel.state == FacebookState.loading
                ? null
                : () {
                    _handleFacebookSignIn(context);
                  },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 50,
                  width: 50,
                  child: Image.asset(
                      'assets/images/facebook-icon-logo-205182.png'),
                ),
                const SizedBox(width: 10),
                Text(
                  'Sign In with Facebook',
                  style: CustomTextStyles.B2,
                ),
              ],
            ),
          ),
          if (viewModel.state == FacebookState.loading)
            const CircularProgressIndicator(),
          if (viewModel.state == FacebookState.success)
            Text(viewModel.message,
                style: const TextStyle(color: Colors.green)),
          if (viewModel.state == FacebookState.error)
            Text(viewModel.message, style: const TextStyle(color: Colors.red)),
        ],
      ),
    );
  }
}
