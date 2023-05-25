abstract class AuthenticationRoutes {
  static const String authenticationModuleRoute = '/authentication';

  static const String authenticationScreenRoute = '/';
  static String authenticationScreenInitialRoute =
      '$authenticationModuleRoute$authenticationScreenRoute';

  static const String singUpScreenRoute = '/sing_up';
  static String singUpScreenInitialRoute =
      '$authenticationModuleRoute$singUpScreenRoute';
}
