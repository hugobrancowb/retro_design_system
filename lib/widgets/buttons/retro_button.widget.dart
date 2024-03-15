part of retro_design_system;

class RetroButton extends StatelessWidget {
  const RetroButton(
    this.label, {
    required this.onPressed,
    this.style,
    this.enabled = true,
    this.focusNode,
    Color? backgroundColor,
    Color? textColor,
    Color? borderColor,
    super.key,
  })  : _backgroundColor = backgroundColor,
        _textColor = textColor,
        _borderColor = borderColor;

  final String label;
  final void Function()? onPressed;
  final ButtonStyle? style;
  final Color? _backgroundColor;
  final Color? _textColor;
  final Color? _borderColor;
  final bool enabled;
  final FocusNode? focusNode;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: enabled ? onPressed : null,
      style: style?.copyWith(
              backgroundColor: MaterialStateProperty.all(backgroundColor)) ??
          ButtonStyle(
            backgroundColor: MaterialStateProperty.all(backgroundColor),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                side: BorderSide(color: borderColor, width: 2.0),
                borderRadius: BorderRadius.zero,
              ),
            ),
            elevation: MaterialStateProperty.all(0),
            mouseCursor: enabled
                ? MaterialStateProperty.all(SystemMouseCursors.click)
                : MaterialStateProperty.all(SystemMouseCursors.basic),
            minimumSize: MaterialStateProperty.all(const Size.fromRadius(18)),
          ),
      focusNode: focusNode,
      child: RetroText(label, isBold: true, color: textColor),
    );
  }

  // TODO: testar cores e salvar método em _ButtonColorsUtil
  Color get backgroundColor {
    late Color mainColor;
    late Color disabledMergeColor;

    mainColor = _backgroundColor ?? Colors.white;
    disabledMergeColor = Colors.black12;

    return enabled
        ? mainColor
        : Color.alphaBlend(disabledMergeColor, mainColor);
  }

  // TODO: testar cores e salvar método em _ButtonColorsUtil
  Color get textColor {
    final mainColor = _textColor ?? Colors.black;
    return enabled ? mainColor : Color.alphaBlend(Colors.white38, mainColor);
  }

  // TODO: testar cores e salvar método em _ButtonColorsUtil
  Color get borderColor {
    if (_borderColor == null) return textColor;

    final mainColor = _borderColor ?? Colors.black;
    return enabled ? mainColor : Color.alphaBlend(Colors.white24, mainColor);
  }
}
