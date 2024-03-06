import 'package:flutter/material.dart';
import 'package:retro_design_system/widgets/text/retro_text.widget.dart';

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
                  ButtonBase.getLightBackground(
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

mixin ButtonBase {
  /// Retorna a cor principal do botão claro de acordo com seu estado atual.
  static Color getLightColor({required bool enabled}) {
    return enabled ? Colors.black : Colors.grey.shade700;
  }

  /// Retorna a cor de fundo do botão claro de acordo com seu estado atual.
  static Color getLightBackground(
      {required bool enabled, required bool isOutlined}) {
    if (enabled == false) return Colors.grey.shade200;
    return isOutlined ? Colors.white : Colors.transparent;
  }
}
