import 'package:congressapp/app/config/routes/paths/path_root.dart';
import 'package:congressapp/presentation/auth/pages/login_screen.dart';
import 'package:congressapp/presentation/auth/pages/register_screen.dart';
import 'package:congressapp/presentation/bottom_nav/bottom_navbar.dart';
import 'package:congressapp/presentation/chat/pages/chat_page.dart';
import 'package:congressapp/presentation/home/pages/homepage.dart';
import 'package:congressapp/presentation/more/pages/setting_page.dart';
import 'package:congressapp/presentation/poll/pages/poll_page.dart';
import 'package:congressapp/presentation/splash/pages/splash_page.dart';
import 'package:flutter/foundation.dart';

import 'package:flutter/material.dart';

// ignore: depend_on_referenced_packages
import 'package:go_router/go_router.dart';

import '../utils/error_screen.dart';

class AppRouter {
  static final key = GlobalKey<NavigatorState>();
  //static final parentShellkey = GlobalKey<NavigatorState>();
  static final _shellNavigatorHome =
      GlobalKey<NavigatorState>(debugLabel: 'shellHome');
  static final _shellNavigatorChat =
      GlobalKey<NavigatorState>(debugLabel: 'shellChat');
  static final _shellNavigatorPolls =
      GlobalKey<NavigatorState>(debugLabel: 'shellPolls');
  static final _shellNavigatorMore =
      GlobalKey<NavigatorState>(debugLabel: 'shellMore');

  static final router = GoRouter(
    initialLocation: Paths.loginScreenRoute.path,
    navigatorKey: key,
    debugLogDiagnostics: kReleaseMode ? false : true,
    routes: [
      GoRoute(
        path: Paths.splashRoute.path,
        name: Paths.splashRoute.routeName,
        pageBuilder: (context, state) => FadeTransitionPage(
          key: state.pageKey,
          // child: const HomeScreen(),
          child: const SplashScreen(),
        ),
      ),
      GoRoute(
        path: Paths.registerScreenRoute.path,
        name: Paths.registerScreenRoute.routeName,
        pageBuilder: (context, state) => FadeTransitionPage(
          key: state.pageKey,
          // child: const HomeScreen(),
          child: const RegisterScreen(),
        ),
      ),
      GoRoute(
        path: Paths.loginScreenRoute.path,
        name: Paths.loginScreenRoute.routeName,
        pageBuilder: (context, state) => FadeTransitionPage(
          key: state.pageKey,
          child: const LoginScreen(),
        ),
        // redirect: (
        //   context,
        //   state,

        // )
        // {

        //   if (islogged == true) {
        //     return Paths.homePageScreenRoute.path;
        //   }
        //   return Paths.registerScreenRoute.path;
        // }
      ),
      StatefulShellRoute.indexedStack(
        // parentNavigatorKey: parentShellkey,
        builder: (context, state, navigationShell) {
          return CustomNavbar(
            navigationShell: navigationShell,
          );
        },
        branches: <StatefulShellBranch>[
          /// [Home_branch]
          StatefulShellBranch(
            navigatorKey: _shellNavigatorHome,
            routes: <RouteBase>[
              GoRoute(
                path: Paths.homePageScreenRoute.path,
                name: Paths.homePageScreenRoute.routeName,
                pageBuilder: (context, state) => FadeTransitionPage(
                  key: state.pageKey,
                  // child: const HomeScreen(),
                  child: const HomePage(),
                ),
              ),
            ],
          ),

          // chat branch
          StatefulShellBranch(
            navigatorKey: _shellNavigatorChat,
            routes: <RouteBase>[
              GoRoute(
                path: Paths.chatPageScreenRoute.path,
                name: Paths.chatPageScreenRoute.routeName,
                pageBuilder: (context, state) => FadeTransitionPage(
                  key: state.pageKey,
                  // child: const HomeScreen(),
                  child: const ChatPage(),
                ),
              ),
            ],
          ),

          StatefulShellBranch(
            navigatorKey: _shellNavigatorPolls,
            routes: <RouteBase>[
              GoRoute(
                path: Paths.pollsPageScreenRoute.path,
                name: Paths.pollsPageScreenRoute.routeName,
                pageBuilder: (context, state) => FadeTransitionPage(
                  key: state.pageKey,
                  // child: const HomeScreen(),
                  child: const PollPage(),
                ),
              ),
            ],
          ),

          StatefulShellBranch(
            navigatorKey: _shellNavigatorMore,
            routes: <RouteBase>[
              GoRoute(
                path: Paths.settingPageScreenRoute.path,
                name: Paths.settingPageScreenRoute.routeName,
                pageBuilder: (context, state) => FadeTransitionPage(
                  key: state.pageKey,
                  // child: const HomeScreen(),
                  child: const SettingPage(),
                ),
              ),
            ],
          ),
        ],
      ),
    ],
    errorBuilder: (context, state) => const ErrorScreen(),
    redirect: (BuildContext context, GoRouterState state) async {
      return null;
    },
  );
}

class FadeTransitionPage extends CustomTransitionPage<void> {
  FadeTransitionPage({
    required LocalKey super.key,
    required super.child,
  }) : super(
          transitionsBuilder: (c, animation, a2, child) => FadeTransition(
            opacity: animation.drive(CurveTween(curve: Curves.easeIn)),
            child: child,
          ),
        );
}
