import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'auth_service.dart';

class FacebookSignInService {
  final AuthService _authService = AuthService();

  Future<Map<String, dynamic>> signIn() async {
    try {
      final LoginResult result = await FacebookAuth.instance.login();
      if (result.status == LoginStatus.success) {
        // Get the access token
        final AccessToken? accessToken = result.accessToken;

        if (accessToken != null) {
          // Use the token string for authentication
          return await _authService.facebookSignIn(accessToken.tokenString);
        } else {
          return {'error': 'Failed to get Facebook access token'};
        }
      } else {
        return {'error': 'Facebook sign in failed: ${result.message}'};
      }
    } catch (error) {
      return {'error': 'Facebook sign in error: ${error.toString()}'};
    }
  }
}
