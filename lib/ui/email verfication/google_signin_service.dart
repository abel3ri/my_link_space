import 'package:google_sign_in/google_sign_in.dart';
import 'auth_service.dart';

class GoogleSignInService {
  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
  final AuthService _authService = AuthService();

  Future<Map<String, dynamic>> signIn() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) return {'error': 'Sign in aborted by user'};

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final String accessToken = googleAuth.accessToken!;

      return await _authService.googleSignIn(accessToken);
    } catch (error) {
      return {'error': error.toString()};
    }
  }
}
