part of retro_design_system;

class RetroText extends StatelessWidget {
  const RetroText(
    this.text, {
    TextStyle? style,
    this.isBold = false,
    this.fontSize = 14.0,
    this.height = 1.2,
    this.color,
    this.overflow,
    this.softWrap,
    this.textAlign,
    super.key,
  }) : _style = style;

  const RetroText.white(
    this.text, {
    TextStyle? style,
    this.isBold = false,
    this.fontSize = 14.0,
    this.height = 1.2,
    this.overflow,
    this.softWrap,
    this.textAlign,
    super.key,
  })  : _style = style,
        color = Colors.white;

  final String text;
  final TextStyle? _style;
  final bool isBold;
  final double fontSize;
  final double height;
  final Color? color;
  final TextOverflow? overflow;
  final bool? softWrap;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style,
      overflow: overflow,
      softWrap: softWrap,
      textAlign: textAlign,
    );
  }

  TextStyle get style {
    return _style?.copyWith(color: color, fontSize: fontSize, height: height) ??
        RegularTextStyle(
          isBold: isBold,
          fontSize: fontSize,
          height: height,
          color: color,
        );
  }
}
