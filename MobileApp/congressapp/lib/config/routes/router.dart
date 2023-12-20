import 'package:congressapp/features/home_screen/presentation/homepage.dart';
import 'package:congressapp/features/onboarding_screen/onBoardingScreen.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:go_router/go_router.dart';

import '../utils/error_screen.dart';
import 'paths.dart';

class AppRouter {
  static final key = GlobalKey<NavigatorState>();
  static final router = GoRouter(
    initialLocation: Paths.demo.path,
    navigatorKey: key,
    debugLogDiagnostics: false,
    routes: [
      GoRoute(
        path: Paths.demo.path,
        name: Paths.demo.routeName,
        pageBuilder: (context, state) => FadeTransitionPage(
          key: state.pageKey,
          // child: const HomeScreen(),
          child: const HomePage(),
        ),
      ),
      GoRoute(
        path: Paths.onboardingScreenRoute.path,
        name: Paths.onboardingScreenRoute.routeName,
        pageBuilder: (context, state) => FadeTransitionPage(
          key: state.pageKey,
          // child: const HomeScreen(),
          child: const OnboardingScreen(),
        ),
      ),
      // ShellRoute(
      //   routes: [
      //     GoRoute(
      //   path: Paths.onboardingScreenRoute.path,
      //   name: Paths.onboardingScreenRoute.routeName,
      //   pageBuilder: (context, state) => FadeTransitionPage(
      //     key: state.pageKey,
      //     // child: const HomeScreen(),
      //     child: const OnboardingScreen(),
      //   ),
      // ),
      //   ]
      //   ),
      //   StatefulShellRoute.indexedStack(branches: branches)
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
