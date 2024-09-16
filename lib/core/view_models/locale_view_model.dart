import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocaleViewModel with ChangeNotifier {
  SharedPreferences prefs;
  LocaleViewModel({
    required this.prefs,
  });

  String get locale {
    return prefs.getString("locale") ?? "en";
  }

  void updateLocale(String locale) {
    prefs.setString("locale", locale);
    notifyListeners();
  }
}
