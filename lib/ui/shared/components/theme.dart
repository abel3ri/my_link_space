import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_link_space/ui/shared/components/colors.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    primaryColor: primaryLightColor,
    colorScheme: const ColorScheme.light(
      primary: primaryLightColor,
      primaryContainer: primaryContainerLightColor,
      secondary: secondaryLightColor,
      secondaryContainer: secondaryContainerLightColor,
      tertiary: tertiaryLightColor,
      error: errorLightColor,
      errorContainer: errorContainerLight,
      surface: surfaceLightColor,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: appBarBackgroundLightColor,
      elevation: 0,
    ),
    scaffoldBackgroundColor: scaffoldBackgroundLightColor,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    useMaterial3: true,
    fontFamily: GoogleFonts.quicksand().fontFamily,
    textTheme: const TextTheme(
      bodySmall: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.normal,
      ),
      bodyMedium: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.normal,
      ),
      bodyLarge: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.normal,
      ),
      titleSmall: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.bold,
      ),
      titleMedium: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
      titleLarge: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      headlineSmall: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
      headlineMedium: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
      headlineLarge: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: appBarBackgroundLightColor,
      selectedItemColor: selectedItemLightColor,
      unselectedItemColor: unselectedItemLightColor,
      selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
      unselectedLabelStyle: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 11,
      ),
      showUnselectedLabels: true,
    ),
  );

  static ThemeData darkTheme = ThemeData(
    primaryColor: primaryDarkColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: appBarBackgroundDarkColor,
      elevation: 0,
    ),
    scaffoldBackgroundColor: scaffoldBackgroundDarkColor,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    useMaterial3: true,
    fontFamily: GoogleFonts.quicksand().fontFamily,
    textTheme: const TextTheme(
      bodySmall: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.normal,
        color: Colors.white,
      ),
      bodyMedium: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.normal,
        color: Colors.white,
      ),
      bodyLarge: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.normal,
        color: Colors.white,
      ),
      titleSmall: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      titleMedium: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      titleLarge: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      headlineSmall: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      headlineMedium: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      headlineLarge: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: appBarBackgroundDarkColor,
      selectedItemColor: selectedItemDarkColor,
      unselectedItemColor: unselectedItemDarkColor,
      selectedLabelStyle: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 12,
      ),
      unselectedLabelStyle: TextStyle(
        fontWeight: FontWeight.normal,
        fontSize: 12,
      ),
      showUnselectedLabels: true,
    ),
    colorScheme: ColorScheme.fromSeed(
      seedColor: primaryDarkColor,
      brightness: Brightness.dark,
    ).copyWith(
      primary: primaryDarkColor,
      primaryContainer: primaryContainerDarkColor,
      secondary: secondaryDarkColor,
      secondaryContainer: secondaryContainerDarkColor,
      tertiary: tertiaryDarkColor,
      error: errorDarkColor,
      errorContainer: errorContainerDark,
      surface: surfaceDarkColor,
    ),
  );
}
