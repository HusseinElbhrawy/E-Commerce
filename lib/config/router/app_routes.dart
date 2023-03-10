import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../app/injector.dart';
import '../../core/utils/app_strings.dart';
import '../../modules/auth/presentation/bloc/auth_bloc.dart';
import '../../modules/auth/presentation/screens/login_screen.dart';
import '../../modules/auth/presentation/screens/register_screen.dart';
import '../../modules/home/presentation/bloc/home_bloc.dart';
import '../../modules/home/presentation/screens/home_screen.dart';
import '../../modules/home/presentation/screens/layout_screen.dart';
import '../../modules/splash/presentation/screens/on_boarding_screen.dart';
import '../../modules/splash/presentation/screens/splash_screen.dart';

class Routes {
  static const String splashRoute = '/';
  static const String onboardingRoute = '/onboarding';
  static const String loginRoute = '/login';
  static const String registersRoute = '/registers';
  static const String layoutRoute = '/layout';
  static const String homeRoute = '/home';
  // static const String cartRoute = '/cart';
  // static const String profileRoute = '/profile';
  // static const String forgetPasswordRoute = '/forgetPassword';
  // static const String storeDetailsRoute = '/storeDetails';
}

class AppRoutes {
  static Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(
          builder: (_) => const SplashScreen(),
        );
      case Routes.onboardingRoute:
        return MaterialPageRoute(
          builder: (_) => const OnBoardingScreen(),
        );

      case Routes.loginRoute:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => serviceLocator<AuthBloc>(),
            child: const LoginScreen(),
          ),
        );
      case Routes.registersRoute:
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: serviceLocator<AuthBloc>(),
            child: const RegisterScreen(),
          ),
        );
      case Routes.layoutRoute:
        return MaterialPageRoute(
          builder: (_) => const LayoutScreen(),
        );
      case Routes.homeRoute:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) =>
                serviceLocator<HomeBloc>()..add(GetHomeDateEvent()),
            child: const HomeScreen(),
          ),
        );
      // case Routes.forgetPasswordRoute:
      //   return MaterialPageRoute(
      //     builder: (_) => const ForgetPasswordScreen(),
      //   );
      // case Routes.storeDetailsRoute:
      //   return MaterialPageRoute(
      //     builder: (_) => const StoreDetailsScreen(),
      //   );
      //! Default
      default:
        return _unDefinedRoute();
    }
  }

  static MaterialPageRoute<dynamic> _unDefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text(AppStrings.noRouteFound),
        ),
        body: const Center(
          child: Text(AppStrings.noRouteFound),
        ),
      ),
    );
  }
}
