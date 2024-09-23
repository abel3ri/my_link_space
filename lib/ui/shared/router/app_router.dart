import 'package:go_router/go_router.dart';
// import 'package:my_link_space/core/view_models/service_view_model.dart';
import 'package:my_link_space/ui/views/forgot_password_view.dart';
import 'package:my_link_space/ui/views/links_veiw.dart';
import 'package:my_link_space/ui/views/log_in_view.dart';
import 'package:my_link_space/ui/views/not_found_view.dart';
import 'package:my_link_space/ui/views/register_nav_view.dart';
import 'package:my_link_space/ui/views/sign_up_view.dart';
import 'package:my_link_space/ui/views/splash_screen_view.dart';
import 'package:my_link_space/utils/page_transition.dart';
// import 'package:provider/provider.dart';

class AppRouter {
  static GoRouter router = GoRouter(
    // redirect: (context, state) {
    //   final authViewModel = Provider.of<AuthViewModel>(context, listen: false);

    //   if (authViewModel.isRegistered) {
    //     if (state.matchedLocation == '/login' ||
    //         state.matchedLocation == '/signup') {
    //       return '/homeview';
    //     }
    //   } else {
    //     if (state.matchedLocation == '/homeview' ||
    //         state.matchedLocation == '/link') {
    //       return '/login';
    //     }
    //   }
    //   return null;
    // },
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

      // Register Navigation Route
      GoRoute(
        path: '/register',
        pageBuilder: (context, state) => PageTransition(
          key: state.pageKey,
          child: const RegisterNav(),
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
