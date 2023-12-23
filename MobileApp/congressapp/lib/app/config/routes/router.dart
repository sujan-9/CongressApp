import 'package:congressapp/presentation/auth/pages/login_screen.dart';
import 'package:congressapp/presentation/auth/pages/register_screen.dart';
import 'package:congressapp/presentation/home/pages/bottom_navbar.dart';

import 'package:congressapp/presentation/onboarding/pages/onboarding_screen.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:go_router/go_router.dart';

import '../utils/error_screen.dart';
import 'paths.dart';

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
    debugLogDiagnostics: false,
    routes: [
      // GoRoute(
      //   path: Paths.demo.path,
      //   name: Paths.demo.routeName,
      //   pageBuilder: (context, state) => FadeTransitionPage(
      //     key: state.pageKey,
      //     // child: const HomeScreen(),
      //     child: const HomePage(),
      //   ),
      // ),
      GoRoute(
        path: Paths.loginScreenRoute.path,
        name: Paths.loginScreenRoute.routeName,
        pageBuilder: (context, state) => FadeTransitionPage(
          key: state.pageKey,
          // child: const HomeScreen(),
          child: const LoginScreen(),
        ),
      ),
      // GoRoute(
      //   path: Paths.registerScreenRoute.path,
      //   name: Paths.registerScreenRoute.routeName,
      //   pageBuilder: (context, state) => FadeTransitionPage(
      //     key: state.pageKey,
      //     // child: const HomeScreen(),
      //     child: const RegisterScreen(),
      //   ),
      // ),
      // GoRoute(
      //   path: Paths.onboardingScreenRoute.path,
      //   name: Paths.onboardingScreenRoute.routeName,
      //   pageBuilder: (context, state) => FadeTransitionPage(
      //     key: state.pageKey,
      //     // child: const HomeScreen(),
      //     child: const OnboardingScreen(),
      //   ),
      // ),

      StatefulShellRoute.indexedStack(
        parentNavigatorKey: parentkey,
        builder: (context, state, navigationShell) {
          return CustomNavbar(
            navigationShell: navigationShell,
          );
        },
        branches: <StatefulShellBranch>[
          /// Brach Home
          StatefulShellBranch(
            navigatorKey: _shellNavigatorHome,
            routes: <RouteBase>[
              GoRoute(
                path: Paths.onboardingScreenRoute.path,
                name: Paths.onboardingScreenRoute.routeName,
                pageBuilder: (context, state) => FadeTransitionPage(
                  key: state.pageKey,
                  // child: const HomeScreen(),
                  child: const OnboardingScreen(),
                ),
              ),
            ],
          ),

          StatefulShellBranch(
            navigatorKey: _shellNavigatorChat,
            routes: <RouteBase>[
              GoRoute(
                path: Paths.registerScreenRoute.path,
                name: Paths.registerScreenRoute.routeName,
                pageBuilder: (context, state) => FadeTransitionPage(
                  key: state.pageKey,
                  // child: const HomeScreen(),
                  child: const RegisterScreen(),
                ),
              ),
            ],
          ),

          // StatefulShellBranch(
          //   navigatorKey: _shellNavigatorPolls,
          //   routes: <RouteBase>[
          //     GoRoute(
          //       path: Paths.demo.path,
          //       name: Paths.demo.routeName,
          //       pageBuilder: (context, state) => FadeTransitionPage(
          //         key: state.pageKey,
          //         // child: const HomeScreen(),
          //         child: const (),
          //       ),
          //     ),
          //   ],
          // ),

          // StatefulShellBranch(
          //   navigatorKey: _shellNavigatorMore,
          //   routes: <RouteBase>[
          //     GoRoute(
          //       path: Paths.loginScreenRoute.path,
          //       name: Paths.loginScreenRoute.routeName,
          //       pageBuilder: (context, state) => FadeTransitionPage(
          //         key: state.pageKey,
          //         // child: const HomeScreen(),
          //         child: const LoginScreen(),
          //       ),
          //     ),
          //   ],
          // ),
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
