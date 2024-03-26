part of retro_design_system;

class RegularTextStyle extends TextStyle {
  const RegularTextStyle({
    Color? color,
    bool isBold = false,
    double? fontSize,
    double? height,
  }) : super(
          fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
          fontFamily: "Ubuntu Mono",
          fontSize: fontSize ?? 14.0,
          height: height ?? 1.2,
          color: color ?? Colors.black,
        );
}
