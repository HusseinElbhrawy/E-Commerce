import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/utils/app_assets.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // late Timer _timer;
  // @override
  // void initState() {
  //   _timer = Timer(
  //     Duration(seconds: AppConstant.splashTime),
  //     () {
  //       Navigator.pushReplacementNamed(context, Routes.onboardingRoute);
  //     },
  //   );
  //   super.initState();
  // }

  // @override
  // void dispose() {
  //   _timer.cancel();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SvgPicture.asset(AppSvgAssets.appLogo),
      ),
    );
  }
}
