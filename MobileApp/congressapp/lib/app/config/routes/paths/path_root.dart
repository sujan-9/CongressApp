import 'package:congressapp/app/config/routes/route_model.dart';

class Paths {
  static final RouteModel demo = RouteModel(routeName: 'demo', path: '/demo');

  static final RouteModel splashRoute =
      RouteModel(routeName: 'splash', path: '/splash');
  static final RouteModel onboardingScreenRoute =
      RouteModel(routeName: 'onboardingScreen', path: '/onboardingScreen');

  static final RouteModel loginScreenRoute =
      RouteModel(routeName: 'loginScreen', path: '/loginScreen');
  static final RouteModel registerScreenRoute =
      RouteModel(routeName: 'registerScreen', path: '/registerScreen');

  static final RouteModel bottomNavbarScreenRoute =
      RouteModel(routeName: 'navbarScreen', path: '/navbarScreen');
  static final RouteModel homePageScreenRoute =
      RouteModel(routeName: 'homePageScreen', path: '/homePageScreen');
  static final RouteModel chatPageScreenRoute =
      RouteModel(routeName: 'chatPageScreen', path: '/chatPageScreen');
  static final RouteModel pollsPageScreenRoute =
      RouteModel(routeName: 'pollsPageScreen', path: '/pollsPageScreen');
  static final RouteModel settingPageScreenRoute =
      RouteModel(routeName: 'settingPageScreen', path: '/settingPageScreen');
  static final RouteModel profilePageScreenRoute =
      RouteModel(routeName: 'profilePageScreen', path: 'profilePageScreen');
  static final RouteModel editProfilePageScreenRoute = RouteModel(
      routeName: 'editProfilePageScreen', path: 'editProfilePageScreen');
  static final RouteModel clenderPageScreenRoute =
      RouteModel(routeName: 'clenderPageScreen', path: 'clenderPageScreen');
  static final RouteModel galleryPageScreenRoute =
      RouteModel(routeName: 'galleryPageScreen', path: 'galleryageScreen');
}
