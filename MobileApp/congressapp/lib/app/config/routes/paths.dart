import 'route_model.dart';

class Paths {
  static final RouteModel splashRoute =
      RouteModel(routeName: 'splash', path: '/splash');

  static final RouteModel homeRoute =
      RouteModel(routeName: 'home', path: '/home');

  static final RouteModel onboardingScreenRoute =
      RouteModel(routeName: 'onboardingScreen', path: '/onboardingScreen');

  static final RouteModel demo = RouteModel(routeName: 'demo', path: '/demo');
  static final RouteModel loginScreenRoute =
      RouteModel(routeName: 'loginScreen', path: '/loginScreen');

  static final RouteModel registerScreenRoute =
      RouteModel(routeName: 'registerScreen', path: '/registerScreen');
  static final RouteModel bottomNavbarScreenRoute =
      RouteModel(routeName: 'navbarScreen', path: '/navbarScreen');
}
