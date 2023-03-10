import 'package:flutter/material.dart';

import 'dimensions.dart';

class AppConstant {
  const AppConstant._();
  static const AppConstant _instance = AppConstant._();
  factory AppConstant() => _instance;

  static Widget horizontalDivider() => const Divider(color: Colors.transparent);
  static Widget verticalDivider() =>
      const VerticalDivider(color: Colors.transparent);

  static int get splashTime => 3;
  static double defaultPadding(BuildContext context) {
    return AppDimensions.width30(context) * 1.2;
  }
}
