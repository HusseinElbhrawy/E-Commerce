import 'package:flutter/material.dart';

import '../config/router/app_routes.dart';
import '../config/themes/dark_theme.dart';
import '../config/themes/light_theme.dart';
import '../core/utils/app_strings.dart';

class MyApp extends StatelessWidget {
  const MyApp._internal();
  static const MyApp _instance = MyApp._internal();

  factory MyApp() => _instance;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppStrings.appName,
      theme: kLightTheme,
      darkTheme: kDarkTheme,
      themeMode: ThemeMode.light,
      onGenerateRoute: AppRoutes.onGenerateRoute,
      initialRoute: Routes.registersRoute,
    );
  }
}
