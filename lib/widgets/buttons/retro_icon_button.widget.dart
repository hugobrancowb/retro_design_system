import 'package:flutter/material.dart';
import 'package:retro_design_system/widgets/text/retro_text.widget.dart';

import 'retro_button.widget.dart';

class RetroIconButton extends ElevatedButton {
  RetroIconButton({
    super.key,
    required IconData icon,
    void Function()? onPressed,
    double iconSize = 18.0,
    Color iconColor = Colors.white,
    Color backgroundColor = Colors.black,
    Color disabledBackgroundColor = Colors.black45,
    bool isOutlined = false,
    String? hintText,
    bool showHint = false,
    double insidePadding = 0,
    bool enabled = true,
  })  : assert(hintText != null || showHint == false),
        super(
          onPressed: enabled ? onPressed : null,
          child: showHint
              ? Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(icon, size: iconSize, color: iconColor),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 12.0),
                      child: RetroLabelText.white(hintText!),
                    ),
                  ],
                )
              : Icon(icon, size: iconSize, color: iconColor),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
                enabled ? backgroundColor : disabledBackgroundColor),
            // shadowColor: MaterialStateProperty.all(Colors.transparent),
            padding: MaterialStateProperty.all(EdgeInsets.all(insidePadding)),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                side: BorderSide(
                    color: isOutlined ? Colors.white : Colors.transparent,
                    width: 2.0),
                borderRadius: BorderRadius.zero,
              ),
            ),
            minimumSize: MaterialStateProperty.all(
              const Size.fromRadius(18),
            ),
            elevation: MaterialStateProperty.all(0),
          ),
        );

  RetroIconButton.light({
    super.key,
    required IconData icon,
    void Function()? onPressed,
    double iconSize = 18.0,
    Color iconColor = Colors.black,
    bool isOutlined = false,
    String? hintText,
    bool showHint = false,
    double insidePadding = 0,
    bool enabled = true,
  })  : assert(hintText != null || showHint == false),
        super(
          onPressed: enabled ? onPressed : null,
          child: showHint
              ? Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                        icon,
                        size: iconSize,
                        color: ButtonBase.getLightColor(enabled: enabled),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 12.0),
                      child: RetroLabelText(hintText!),
                    ),
                  ],
                )
              : Icon(icon, size: iconSize, color: iconColor),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
              ButtonBase.getLightBackground(
                  isOutlined: isOutlined, enabled: enabled),
            ),
            shadowColor: isOutlined
                ? null
                : MaterialStateProperty.all(Colors.transparent),
            padding: MaterialStateProperty.all(EdgeInsets.all(insidePadding)),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                side: BorderSide(
                    color: isOutlined
                        ? ButtonBase.getLightColor(enabled: enabled)
                        : Colors.transparent,
                    width: 2.0),
                borderRadius: BorderRadius.zero,
              ),
            ),
            minimumSize: MaterialStateProperty.all(
              const Size.fromRadius(18),
            ),
            elevation: MaterialStateProperty.all(0),
          ),
        );
}
