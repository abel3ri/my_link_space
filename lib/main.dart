import 'dart:io';

import 'package:flutter/material.dart';
import 'package:my_link_space/core/models/google_auth_model.dart';
import 'package:my_link_space/core/models/services/authservice.dart';
import 'package:my_link_space/core/view_models/email_verification_view_model.dart';
import 'package:my_link_space/core/view_models/home_view_model.dart';
import 'package:my_link_space/core/view_models/log_in_view_model.dart';
import 'package:my_link_space/core/view_models/forgot_view_model.dart';
import 'package:my_link_space/core/view_models/reset_password_view_model.dart';
import 'package:my_link_space/core/view_models/sign_upvm.dart';
import 'package:my_link_space/core/view_models/verifycode_view_model.dart';
import 'package:my_link_space/ui/shared/components/theme.dart';
import 'package:my_link_space/ui/shared/router/app_router.dart';
import 'package:provider/provider.dart';

void main(List<String> args) async {
  HttpOverrides.global = MyHttpOverrides();
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => HomeViewModel()),
        ChangeNotifierProvider(create: (context) => AuthService()),
        ChangeNotifierProvider(create: (context) => GoogleSignupViewModel()),
        ChangeNotifierProvider(create: (context) => LogInViewModel()),
        ChangeNotifierProvider(create: (context) => GoogleSignInModel()),
        ChangeNotifierProvider(create: (context) => SignUpvm()),
        ChangeNotifierProvider(create: (context) => ForgotPasswordViewModel()),
        ChangeNotifierProvider(create: (context) => VerifyCodeViewModel()),
        ChangeNotifierProvider(create: (context) => ResetPasswordViewModel()),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: AppRouter.router,
        themeMode: ThemeMode.system,
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
      ),
    ),
  );
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

class GoogleSignInScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final googleSignInModel = Provider.of<GoogleSignInModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Google Sign In Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            googleSignInModel.currentUser == null
                ? ElevatedButton(
                    onPressed: () {
                      googleSignInModel.handleSignIn();
                    },
                    child: Text('Sign In with Google'),
                  )
                : Column(
                    children: [
                      Text(
                          'Signed in as: ${googleSignInModel.currentUser!.email}'),
                      ElevatedButton(
                        onPressed: () {
                          googleSignInModel.handleSignOut();
                        },
                        child: Text('Sign Out'),
                      ),
                    ],
                  ),
          ],
        ),
      ),
    );
  }
}
