import 'package:flutter/material.dart';
import 'package:retro_design_system/retro_design_system.dart';
import 'package:retro_design_system/widgets/loading_state/loading_state.widget.dart';

class RetroBigButton extends ElevatedButton {
  RetroBigButton(
    String label, {
    super.key,
    required onPressed,
    bool? loading = false,
    ButtonStyle? style,
    Color? color,
    bool isOutlined = true,
  }) : super(
          onPressed: loading != true ? onPressed : null,
          child: loading != true
              ? RetroH5.white(label, isBold: true)
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    RetroH5.white(label, isBold: true),
                    const SizedBox(width: 16),
                    const LoadingState.white(),
                  ],
                ),
          style: style ??
              ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(color ?? RetroColors.randomColor),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    side: BorderSide(
                      color: isOutlined ? Colors.black : Colors.transparent,
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.zero,
                  ),
                ),
                padding: MaterialStateProperty.all(
                  loading != true
                      ? const EdgeInsets.symmetric(
                          vertical: 16.0,
                          horizontal: 32.0,
                        )
                      : const EdgeInsets.only(
                          top: 16.0,
                          bottom: 16.0,
                          right: 16.0,
                          left: 32.0,
                        ),
                ),
                mouseCursor: MaterialStateProperty.all(
                  SystemMouseCursors.click,
                ),
                // TODO: isolar tamanhos padrões
                minimumSize:
                    MaterialStateProperty.all(const Size.fromRadius(18)),
                elevation: MaterialStateProperty.all(0),
              ),
        );
}