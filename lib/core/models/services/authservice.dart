import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  Future<void> setUserRegistered() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isRegistered', true);
  }

  Future<bool> isUserRegistered() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('isRegistered') ?? false;
  }
}
