import 'package:go_router/go_router.dart';
import 'package:my_link_space/app/modules/error/not_found_view.dart';
import 'package:my_link_space/app/modules/home/views/home_view.dart';
import 'package:my_link_space/core/utils/page_transition.dart';

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
