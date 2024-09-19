import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:my_link_space/core/view_models/home_view_model.dart';
import 'package:my_link_space/core/view_models/locale_view_model.dart';
import 'package:my_link_space/core/view_models/theme_view_model.dart';
import 'package:my_link_space/l10n/l10n.dart';
import 'package:my_link_space/ui/shared/components/theme.dart';
import 'package:my_link_space/ui/shared/router/app_router.dart';
import 'package:my_link_space/utils/get_theme.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  final themeMode = prefs.getString("theme");
  themeMode == null ? prefs.setString("theme", "system") : null;
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => HomeViewModel()),
        ChangeNotifierProvider(
          create: (context) => ThemeViewModel(prefs: prefs),
        ),
        ChangeNotifierProvider(
          create: (context) => LocaleViewModel(prefs: prefs),
        ),
      ],
      child: Builder(
        builder: (context) {
          final selectedTheme =
              Provider.of<ThemeViewModel>(context).getCurrentThemeMode();
          final locale = Provider.of<LocaleViewModel>(context).locale;
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            routerConfig: AppRouter.router,
            themeMode: getThemeMode(selectedTheme),
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            locale: Locale(locale),
            supportedLocales: L10n.locales,
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
          );
        },
      ),
    ),
  );
}
