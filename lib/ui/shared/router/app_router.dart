import 'package:go_router/go_router.dart';
import 'package:my_link_space/ui/views/home_view.dart';
import 'package:my_link_space/ui/views/not_found_view.dart';
import 'package:my_link_space/utils/page_transition.dart';

class AppRouter {
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: "/",
        pageBuilder: (context, state) => PageTransition(
          key: state.pageKey,
          child: const HomeView(),
        ),
      ),
    ],
    errorPageBuilder: (context, state) => PageTransition(
      key: state.pageKey,
      child: const NotFoundView(),
    ),
  );
}
