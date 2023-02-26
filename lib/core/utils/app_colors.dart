import 'package:flutter/material.dart';

import 'hex_color.dart';

class AppColors {
  const AppColors._();
  static const AppColors _instance = AppColors._();
  factory AppColors() => _instance;

  static HexColor background = HexColor('#1C1C23');
  static HexColor primary = HexColor('#FF7966');
  static HexColor grey = HexColor('#353542');
  static HexColor darkGrey = HexColor('#353339');
  static HexColor lightGrey = HexColor('#4E4E61');
  static HexColor googleButtonColor = HexColor('#EFEFEF');
  static const Color black = Colors.black;
  static const Color blue = Colors.blue;
  static const Color error = Colors.red;
}
