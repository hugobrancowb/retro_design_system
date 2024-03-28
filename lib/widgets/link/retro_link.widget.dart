part of retro_design_system;

class RetroLink extends StatefulWidget {
  const RetroLink(
    this.label, {
    required this.onPressed,
    this.lineOverhang = 4.0,
    this.textDirection,
    this.textAlign,
    this.style,
    this.fontSize,
    super.key,
  }) : assert(
          lineOverhang > 0,
          'lineOverhang must have a value bigger than zero to assist accessibility effects such as hover and traversal',
        );

  final String label;
  final void Function() onPressed;
  final double lineOverhang;
  final TextDirection? textDirection;
  final TextAlign? textAlign;
  final TextStyle? style;
  final double? fontSize;

  @override
  State<RetroLink> createState() => _RetroLinkState();
}

class _RetroLinkState extends State<RetroLink> {
  bool isHovering = false;

  @override
  Widget build(BuildContext context) {
    final letterSpacing =
        Theme.of(context).primaryTextTheme.bodyMedium?.letterSpacing;
    final style = (widget.style ?? const RegularTextStyle(isBold: true))
        .copyWith(fontSize: widget.fontSize, letterSpacing: letterSpacing);
    final textAlign = widget.textAlign ?? TextAlign.center;
    final textDirection = widget.textDirection ?? TextDirection.ltr;

    Widget linkWidget = _RetroLinkTextWidget(
      widget.label,
      isHovering: isHovering,
      lineOverhang: widget.lineOverhang,
      style: style,
      textAlign: textAlign,
      textDirection: textDirection,
    );

    if (kIsWeb) {
      linkWidget = MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: (_) => setState(() => isHovering = true),
        onExit: (_) => setState(() => isHovering = false),
        child: linkWidget,
      );
    }

    return Focus(
      onFocusChange: (hasFocus) => setState(() => isHovering = hasFocus),
      child: GestureDetector(
        onTapDown: (_) => kIsWeb ? null : setState(() => isHovering = true),
        onTapUp: (_) => kIsWeb ? null : setState(() => isHovering = false),
        onTap: widget.onPressed,
        child: linkWidget,
      ),
    );
  }
}
