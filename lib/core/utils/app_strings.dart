class AppStrings {
  AppStrings._internal();
  static final AppStrings _instance = AppStrings._internal();
  factory AppStrings() => _instance;

  static const appName = 'E Commerce';

  //! Login Screen
  static const String loginToYourAccount = 'Login to your account';

  static const String contentType = 'Content-Type';
  static const String applicationJson = 'application/json';
  static const String noRouteFound = 'No Route Found';
}
