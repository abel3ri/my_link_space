import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class GoogleSignInModel extends ChangeNotifier {
  final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: ['email'],
  );

  GoogleSignInAccount? _currentUser;
  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();

  GoogleSignInAccount? get currentUser => _currentUser;

  Future<void> handleSignIn() async {
    try {
      _currentUser = await _googleSignIn.signIn();
      notifyListeners();

      if (_currentUser != null) {
        GoogleSignInAuthentication auth = await _currentUser!.authentication;
        await _secureStorage.write(
            key: 'google_token', value: auth.accessToken);

        await _secureStorage.write(
            key: 'user_email', value: _currentUser!.email);
      }
    } catch (error) {
      print('Error during Google Sign-In: $error');
    }
  }

  Future<void> handleSignOut() async {
    await _googleSignIn.signOut();
    _currentUser = null;
    notifyListeners();
    // Clear stored token and email from secure storage
    await _secureStorage.delete(key: 'google_token');
    await _secureStorage.delete(key: 'user_email');
  }

  Future<String?> getStoredEmail() async {
    return await _secureStorage.read(key: 'user_email');
  }
}
