import 'package:flutter/material.dart';

ThemeMode getThemeMode(String? themeMode) {
  if (themeMode == null || themeMode == 'system') return ThemeMode.system;
  if (themeMode == 'dark') return ThemeMode.dark;
  return ThemeMode.light;
}
