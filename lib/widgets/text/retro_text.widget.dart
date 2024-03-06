import 'package:flutter/material.dart';

class RetroText extends Text {
  RetroText(
    super.text, {
    super.key,
    TextStyle? style,
    bool isBold = false,
    double fontSize = 14.0,
    double height = 1.2,
    Color? color,
    super.overflow,
    super.softWrap,
    super.textAlign,
  }) : super(
          style: style ??
              RegularTextStyle(
                isBold: isBold,
                fontSize: fontSize,
                height: height,
                color: color,
              ),
        );

  RetroText.white(
    super.text, {
    super.key,
    TextStyle? style,
    bool isBold = false,
    double fontSize = 14.0,
    double height = 1.2,
    super.overflow,
    super.softWrap,
    super.textAlign,
  }) : super(
          style: style ??
              RegularTextStyle(
                isBold: isBold,
                fontSize: fontSize,
                height: height,
                color: Colors.white,
              ),
        );
}

class RegularTextStyle extends TextStyle {
  const RegularTextStyle({
    Color? color,
    bool isBold = false,
    double fontSize = 14.0,
    double height = 1.2,
  }) : super(
          fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
          fontFamily: "Ubuntu Mono",
          fontSize: fontSize,
          height: height,
          color: color ?? Colors.black,
        );
}

class RetroLabelText extends RetroText {
  RetroLabelText(
    super.text, {
    super.key,
    super.style,
    super.color,
    super.isBold = false,
    super.fontSize = 12.0,
  }) : super();

  RetroLabelText.white(
    super.text, {
    super.key,
    super.style,
    super.isBold = false,
    super.fontSize = 12.0,
  }) : super.white();
}
