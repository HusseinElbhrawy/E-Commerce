const String imagePath = 'assets/images';
const String svgPath = 'assets/svg';
const String lottiePath = 'assets/lottie';

class AppImagesAssets {
  AppImagesAssets._internal();
  static final AppImagesAssets _instance = AppImagesAssets._internal();
  factory AppImagesAssets() => _instance;

  static const appLogo = '$imagePath/slider1.png';
}

class AppSvgAssets {
  AppSvgAssets._internal();
  static final AppSvgAssets _instance = AppSvgAssets._internal();
  factory AppSvgAssets() => _instance;

  static const appLogo = '$svgPath/slider1.png';
}

class AppLottieAssets {
  AppLottieAssets._internal();
  static final AppLottieAssets _instance = AppLottieAssets._internal();
  factory AppLottieAssets() => _instance;

  static const appLogo = '$lottiePath/slider1.png';
}
