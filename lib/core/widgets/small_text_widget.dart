import 'package:flutter/material.dart';

import '../utils/dimensions.dart';

class SmallTextWidget extends StatelessWidget {
  const SmallTextWidget(
    this.text, {
    Key? key,
    this.size,
    this.color,
    this.height = 1.2,
    this.fontWeight,
    this.maxLines,
    this.textAlign,
    this.decoration,
    this.fontFamily,
    this.overflow,
  }) : super(key: key);
  final String text;
  final Color? color;
  final double? size;
  final double height;
  final FontWeight? fontWeight;
  final int? maxLines;
  final TextAlign? textAlign;
  final TextDecoration? decoration;
  final String? fontFamily;
  final TextOverflow? overflow;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLines,
      overflow: overflow,
      textAlign: textAlign,
      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            decoration: decoration,
            fontSize: size ?? AppDimensions.font16(context),
            fontFamily: fontFamily,
            height: height,
            color: color,
            overflow: TextOverflow.ellipsis,
            fontWeight: fontWeight ?? FontWeight.normal,
          ),
    );
  }
}
