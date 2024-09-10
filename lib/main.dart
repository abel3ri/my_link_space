import 'package:flutter/material.dart';
import 'package:my_link_space/core/view_model/home_view_model.dart';
import 'package:my_link_space/ui/shared/components/theme.dart';
import 'package:my_link_space/ui/shared/router/app_router.dart';
import 'package:provider/provider.dart';

void main(List<String> args) {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => HomeViewModel()),
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
