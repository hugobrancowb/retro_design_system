part of retro_design_system;

class RetroButton extends ElevatedButton {
  RetroButton(
    String label, {
    super.key,
    required super.onPressed,
    ButtonStyle? style,
    Color color = Colors.black,
    bool isOutlined = false,
    bool enabled = true,
    FocusNode? focusNode,
  }) : super(
          child: RetroText.white(label, isBold: true),
          style: style ??
              ButtonStyle(
                backgroundColor: MaterialStateProperty.all(color),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    side: BorderSide(
                      color: isOutlined ? Colors.black : Colors.transparent,
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.zero,
                  ),
                ),
                elevation: MaterialStateProperty.all(0),
                mouseCursor: MaterialStateProperty.all(
                  SystemMouseCursors.click,
                ),
                minimumSize:
                    MaterialStateProperty.all(const Size.fromRadius(18)),
              ),
          focusNode: focusNode,
        );

  RetroButton.light(
    String label, {
    super.key,
    required super.onPressed,
    ButtonStyle? style,
    Color color = Colors.white,
    bool isOutlined = false,
    bool enabled = true,
    FocusNode? focusNode,
  }) : super(
          child: RetroText(label, isBold: true),
          style: style ??
              ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                  _ButtonColorsUtil.getLightBackground(
                    enabled: enabled,
                    isOutlined: isOutlined,
                  ),
                ),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    side: BorderSide(
                      color: isOutlined ? Colors.black : Colors.transparent,
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.zero,
                  ),
                ),
                elevation: MaterialStateProperty.all(0),
                mouseCursor: MaterialStateProperty.all(
                  SystemMouseCursors.click,
                ),
                minimumSize: MaterialStateProperty.all(
                  const Size.fromRadius(18),
                ),
              ),
          focusNode: focusNode,
        );
}
