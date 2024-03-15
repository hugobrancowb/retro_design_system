part of retro_design_system;

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
