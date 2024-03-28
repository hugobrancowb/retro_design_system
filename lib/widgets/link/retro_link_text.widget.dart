part of retro_design_system;

class _RetroLinkTextWidget extends LeafRenderObjectWidget {
  const _RetroLinkTextWidget(
    this.label, {
    required this.isHovering,
    required this.lineOverhang,
    required this.textDirection,
    required this.textAlign,
    required this.style,
  });

  final String label;
  final bool isHovering;
  final double lineOverhang;
  final TextDirection textDirection;
  final TextAlign textAlign;
  final TextStyle style;

  @override
  _RetroLinkRenderObject createRenderObject(BuildContext context) =>
      _RetroLinkRenderObject(
        textPainter: textPainter,
        lineOverhang: lineOverhang,
        isHovering: isHovering,
      );

  @override
  void updateRenderObject(
    BuildContext context,
    _RetroLinkRenderObject renderObject,
  ) {
    renderObject.textPainter = textPainter;
    renderObject.isHovering = isHovering;
    renderObject.lineOverhang = lineOverhang;
  }

  TextPainter get textPainter => TextPainter(
        textDirection: textDirection,
        textAlign: textAlign,
        text: TextSpan(
          text: label,
          style: style,
        ),
      );
}
