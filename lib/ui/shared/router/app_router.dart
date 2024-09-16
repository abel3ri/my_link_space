import 'package:go_router/go_router.dart';
import 'package:my_link_space/ui/views/add_new_link_view.dart';
import 'package:my_link_space/ui/views/delete_account_view.dart';
import 'package:my_link_space/ui/views/home_view.dart';
import 'package:my_link_space/ui/views/not_found_view.dart';
import 'package:my_link_space/ui/views/upgrade_view.dart';
import 'package:my_link_space/utils/page_transition.dart';

class AppRouter {
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: "/",
        name: "home",
        pageBuilder: (context, state) => PageTransition(
          key: state.pageKey,
          child: HomeView(),
        ),
      ),
      GoRoute(
        path: "/delete-account",
        name: "deleteAccount",
        pageBuilder: (context, state) => PageTransition(
          key: state.pageKey,
          child: DeleteAccountView(),
        ),
      ),
      GoRoute(
        path: "/upgrade",
        name: "upgrade",
        pageBuilder: (context, state) => PageTransition(
          key: state.pageKey,
          child: UpgradeView(),
        ),
      ),
      GoRoute(
        path: "/add-new-link",
        name: "addNewLink",
        pageBuilder: (context, state) => PageTransition(
          key: state.pageKey,
          child: AddNewLinkView(),
        ),
      ),
    ],
    errorPageBuilder: (context, state) => PageTransition(
      key: state.pageKey,
      child: const NotFoundView(),
    ),
  );
}
