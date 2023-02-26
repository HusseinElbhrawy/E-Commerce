import 'package:flutter/cupertino.dart';

import 'media_query_values.dart';

class AppDimensions {
  const AppDimensions._();
  static const AppDimensions _instance = AppDimensions._();
  factory AppDimensions() => _instance;

  static double screenHeight(BuildContext context) => context.height;
  static double screenWidth(BuildContext context) => context.width;

  //! Dynamic Height padding and margin
  static double height10(BuildContext context) => context.isPortrait
      ? screenHeight(context) / 84.4
      : screenHeight(context) / 75;

  static double height15(BuildContext context) => context.isPortrait
      ? screenHeight(context) / 56.27
      : screenHeight(context) / 50;

  static double height20(BuildContext context) => context.isPortrait
      ? screenHeight(context) / 42.2
      : screenHeight(context) / 35;

  static double height30(BuildContext context) => context.isPortrait
      ? screenHeight(context) / 28.13
      : screenHeight(context) / 25;

  static double height45(BuildContext context) {
    return context.isPortrait
        ? screenHeight(context) / 18.76
        : screenHeight(context) / 10;
  }

  //! Dynamic Width padding and margin
  static double width10(BuildContext context) => context.isPortrait
      ? screenWidth(context) / 84.4
      : screenWidth(context) / 84.4;
  static double width15(BuildContext context) => screenWidth(context) / 56.27;
  static double width20(BuildContext context) => screenWidth(context) / 42.2;
  static double width30(BuildContext context) => context.isPortrait
      ? screenWidth(context) / 28.13
      : screenWidth(context) / 40;

  //! Dynamic fonts Size
  static double font26(BuildContext context) => context.isPortrait
      ? screenHeight(context) / 32.46
      : screenHeight(context) / 15;

  static double font20(BuildContext context) => context.isPortrait
      ? screenHeight(context) / 42.2
      : screenHeight(context) / 18;

  static double font16(BuildContext context) => context.isPortrait
      ? screenHeight(context) / 52.75
      : screenHeight(context) / 20;

  static double font12(BuildContext context) => context.isPortrait
      ? screenHeight(context) / 52.2
      : screenHeight(context) / 25;

  //! Dynamic borderRadius
  static double radius15(BuildContext context) => screenHeight(context) / 56.27;
  static double radius20(BuildContext context) => screenHeight(context) / 42.2;
  static double radius30(BuildContext context) => screenHeight(context) / 28.13;

  //! Dynamic iconSize
  static double iconSize24(BuildContext context) =>
      screenHeight(context) / 35.17;
  static double iconSize16(BuildContext context) =>
      screenHeight(context) / 52.75;
}
