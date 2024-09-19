// PS C:\Users\hp\Desktop\kuraz\my-link-space-main> git show 44dd548ec6ecf1e63f549fbb65e0b0768e0522d9
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:my_link_space/core/view_models/home_view_model.dart';
import 'package:my_link_space/core/view_models/log_in_view_model.dart';
import 'package:my_link_space/core/view_models/service_view_model.dart';
import 'package:my_link_space/ui/shared/components/theme.dart';
import 'package:my_link_space/ui/shared/router/app_router.dart';
import 'package:provider/provider.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => HomeViewModel()),
        ChangeNotifierProvider(create: (context) => AuthViewModel()),
        ChangeNotifierProvider(create: (context) => LogInViewModel()),
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
