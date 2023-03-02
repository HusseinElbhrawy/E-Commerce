import 'package:flutter/material.dart';

import '../utils/dimensions.dart';

class BigTextWidget extends StatelessWidget {
  const BigTextWidget(
    this.text, {
    Key? key,
    this.size,
    this.fontWeight,
    this.overflow = TextOverflow.ellipsis,
    this.color,
    this.maxLines,
    this.align,
    this.height,
    this.letterSpacing,
    this.fontFamily,
  }) : super(key: key);
  final String text;
  final Color? color;
  final double? size;
  final TextOverflow overflow;
  final FontWeight? fontWeight;
  final int? maxLines;
  final TextAlign? align;
  final double? height;
  final double? letterSpacing;
  final String? fontFamily;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: overflow,
      maxLines: maxLines ?? 1,
      textAlign: align,
      style: Theme.of(context).textTheme.headlineSmall!.copyWith(
            fontSize: size ?? AppDimensions.font26(context),
            color: color,
            fontWeight: fontWeight,
            height: height,
            letterSpacing: letterSpacing,
            fontFamily: fontFamily,
          ),
    );
  }
}
