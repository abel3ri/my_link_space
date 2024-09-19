import 'package:go_router/go_router.dart';
import 'package:my_link_space/core/view_models/service_view_model.dart';
import 'package:my_link_space/ui/views/forgot_password.dart';
import 'package:my_link_space/ui/views/links.dart';
import 'package:my_link_space/ui/views/log_in.dart';
import 'package:my_link_space/ui/views/not_found_view.dart';
import 'package:my_link_space/ui/views/register_nav.dart';
import 'package:my_link_space/ui/views/sign_up.dart';
import 'package:my_link_space/ui/views/splash_screen.dart';
import 'package:my_link_space/utils/page_transition.dart';
import 'package:provider/provider.dart';

class AppRouter {
  static GoRouter router = GoRouter(
    // initialLocation: '/', // Start at splash screen or login
    redirect: (context, state) {
      final authViewModel = Provider.of<AuthViewModel>(context, listen: false);

      // Redirect logic based on authentication status
      if (authViewModel.isRegistered) {
        if (state.matchedLocation == '/login' ||
            state.matchedLocation == '/signup') {
          return '/homeview'; // Redirect to home if logged in
        }
      } else {
        if (state.matchedLocation == '/homeview' ||
            state.matchedLocation == '/link') {
          return '/login'; // Redirect to login if not authenticated
        }
      }
      return null; // No redirection needed
    },
    routes: [
      GoRoute(
        path: '/',
        pageBuilder: (context, state) => PageTransition(
          key: state.pageKey,
          child: const SplashScreen(),
        ),
      ),

      // Sign-up route
      GoRoute(
        path: '/signup',
        pageBuilder: (context, state) => PageTransition(
          key: state.pageKey,
          child: SignUp(),
        ),
      ),

      // Log-in route
      GoRoute(
        path: '/login',
        pageBuilder: (context, state) => PageTransition(
          key: state.pageKey,
          child: LogIn(),
        ),
      ),
      GoRoute(
        path: '/link',
        pageBuilder: (context, state) => PageTransition(
          key: state.pageKey,
          child: Links(),
        ),
      ),
      GoRoute(
        path: '/forgot',
        pageBuilder: (context, state) => PageTransition(
          key: state.pageKey,
          child: ForgotPassword(),
        ),
      ),

      // ShellRoute to manage persistent bottom navigation bar

      // Register Navigation Route
      GoRoute(
        path: '/register',
        pageBuilder: (context, state) => PageTransition(
          key: state.pageKey,
          child: RegisterNav(),
        ),
      ),
    ],

    // 404 Route
    errorPageBuilder: (context, state) => PageTransition(
      key: state.pageKey,
      child: const NotFoundView(),
    ),
  );
}
