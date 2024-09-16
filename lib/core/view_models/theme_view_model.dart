import 'package:flutter/material.dart';
import "package:shared_preferences/shared_preferences.dart";

class ThemeViewModel with ChangeNotifier {
  SharedPreferences prefs;
  ThemeViewModel({required this.prefs});

  String getCurrentThemeMode() {
    return prefs.getString("theme")!;
  }

  Future<void> changeSelectedTheme(String value) async {
    await prefs.setString("theme", value);
    notifyListeners();
  }
}
