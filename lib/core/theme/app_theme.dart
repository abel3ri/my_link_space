import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    primaryColor: const Color(0xff7f74fe),
    colorScheme: const ColorScheme.light(
      primary: Color(0xff7f74fe),
      primaryContainer: Color(0xffd4ccff),
      secondary: Color(0xff6c63ff),
      secondaryContainer: Color(0xffe0dcff),
      tertiary: Color(0xff5c52e7),
      error: Color(0xffd32f2f),
      surface: Color(0xFFEDE7FF),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFFEDE7FF),
      elevation: 0,
    ),
    scaffoldBackgroundColor: const Color(0xFFEDE7FF),
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
      backgroundColor: Color(0xFFEDE7FF),
      selectedItemColor: Color(0xff7f74fe),
      unselectedItemColor: Colors.grey,
      selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
      unselectedLabelStyle: TextStyle(
        fontWeight: FontWeight.normal,
        fontSize: 12,
      ),
      showUnselectedLabels: true,
    ),
  );

  static ThemeData darkTheme = ThemeData(
    primaryColor: const Color(0xff7f74fe),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF1E1E1E),
      elevation: 0,
    ),
    scaffoldBackgroundColor: const Color(0xFF1E1E1E),
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
      backgroundColor: Color(0xFF1E1E1E),
      selectedItemColor: Color(0xff7f74fe),
      unselectedItemColor: Colors.grey,
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
      seedColor: const Color(0xff7f74fe),
      brightness: Brightness.dark,
    )
        .copyWith(
          primary: const Color(0xff7f74fe),
          primaryContainer: const Color(0xff5c52e7),
          secondary: const Color(0xff967dff),
          secondaryContainer: const Color(0xff4136b2),
          tertiary: const Color(0xff4a42c8),
          error: const Color(0xffcf6679),
          surface: const Color(0xFF1E1E1E),
        )
        .copyWith(error: const Color(0xffcf6679)),
  );
}
