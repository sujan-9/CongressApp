import 'package:congressapp/app/config/routes/paths/path_chat_shell.dart';
import 'package:congressapp/app/config/routes/paths/path_home_shell.dart';
import 'package:congressapp/app/config/routes/paths/path_more_shell.dart';
import 'package:congressapp/app/config/routes/paths/path_polls_shell.dart';
import 'package:congressapp/presentation/auth/pages/login_screen.dart';
import 'package:congressapp/presentation/auth/pages/register_screen.dart';
import 'package:congressapp/presentation/bottom_nav/bottom_navbar.dart';
import 'package:congressapp/presentation/chat/pages/chat_page.dart';
import 'package:congressapp/presentation/home/pages/homepage.dart';
import 'package:congressapp/presentation/more/pages/setting_page.dart';

import 'package:congressapp/presentation/onboarding/pages/onboarding_screen.dart';
import 'package:congressapp/presentation/polls/pages/poll_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:go_router/go_router.dart';

import '../utils/error_screen.dart';
import 'paths/path_root.dart';

class AppRouter {
  static final key = GlobalKey<NavigatorState>();
  static final parentkey = GlobalKey<NavigatorState>();
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
        path: Paths.onboardingScreenRoute.path,
        name: Paths.onboardingScreenRoute.routeName,
        pageBuilder: (context, state) => FadeTransitionPage(
          key: state.pageKey,
          // child: const HomeScreen(),
          child: const OnboardingScreen(),
        ),
      ),
      GoRoute(
        path: Paths.loginScreenRoute.path,
        name: Paths.loginScreenRoute.routeName,
        pageBuilder: (context, state) => FadeTransitionPage(
          key: state.pageKey,
          child: const LoginScreen(),
        ),
      ),
      GoRoute(
        path: Paths.registerScreenRoute.path,
        name: Paths.registerScreenRoute.routeName,
        pageBuilder: (context, state) => FadeTransitionPage(
          key: state.pageKey,
          child: const RegisterScreen(),
        ),
      ),
      StatefulShellRoute.indexedStack(
        parentNavigatorKey: parentkey,
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
                path: PathsHomeShell.homeRoute.path,
                name: PathsHomeShell.homeRoute.routeName,
                pageBuilder: (context, state) => FadeTransitionPage(
                  key: state.pageKey,
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
                path: PathsChatShell.chatRoute.path,
                name: PathsChatShell.chatRoute.routeName,
                pageBuilder: (context, state) => FadeTransitionPage(
                  key: state.pageKey,
                  child: const ChatPage(),
                ),
              ),
            ],
          ),

          // Poll Branch
          StatefulShellBranch(
            navigatorKey: _shellNavigatorPolls,
            routes: <RouteBase>[
              GoRoute(
                path: PathsPollsShell.pollRoute.path,
                name: PathsPollsShell.pollRoute.routeName,
                pageBuilder: (context, state) => FadeTransitionPage(
                  key: state.pageKey,
                  child: const PollPage(),
                ),
              ),
            ],
          ),

          // more or setting Branch
          StatefulShellBranch(
            navigatorKey: _shellNavigatorMore,
            routes: <RouteBase>[
              GoRoute(
                path: PathsMoreShell.moreRoute.path,
                name: PathsMoreShell.moreRoute.routeName,
                pageBuilder: (context, state) => FadeTransitionPage(
                  key: state.pageKey,
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
