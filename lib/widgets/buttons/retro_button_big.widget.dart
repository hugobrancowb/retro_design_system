part of retro_design_system;

class RetroBigButton extends StatelessWidget {
  const RetroBigButton(
    this.label, {
    required this.onPressed,
    this.enabled = true,
    this.loading = false,
    this.style,
    this.color,
    this.isOutlined = true,
    super.key,
  });

  final String label;
  final void Function()? onPressed;
  final bool enabled;
  final bool? loading;
  final ButtonStyle? style;
  final Color? color;
  final bool isOutlined;

  @override
  Widget build(BuildContext context) {
    final buttonText = RetroH5.white(label, isBold: true);

    final innerContentButton = loading != true
        ? buttonText
        : Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              buttonText,
              const SizedBox(width: 16),
              const LoadingState.white(),
            ],
          );

    final backgroundColor =
        MaterialStateProperty.all(color ?? RetroColors.randomColor);

    return ElevatedButton(
      onPressed: (loading != true && enabled) ? onPressed : null,
      style: style?.copyWith(backgroundColor: backgroundColor) ??
          ButtonStyle(
            backgroundColor: backgroundColor,
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
                  ? const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0)
                  : const EdgeInsets.only(
                      top: 16.0,
                      bottom: 16.0,
                      right: 16.0,
                      left: 32.0,
                    ),
            ),
            mouseCursor: enabled
                ? MaterialStateProperty.all(SystemMouseCursors.click)
                : MaterialStateProperty.all(SystemMouseCursors.basic),
            minimumSize: MaterialStateProperty.all(
              const Size.fromRadius(_SizeTokens.buttonMinimumSize),
            ),
            elevation: MaterialStateProperty.all(0),
          ),
      child: innerContentButton,
    );
  }
}
