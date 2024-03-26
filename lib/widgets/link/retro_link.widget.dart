part of retro_design_system;

class RetroLink extends StatefulWidget {
  const RetroLink(
    this.label, {
    required this.onPressed,
    this.lineOverhang = 2.0,
    this.textDirection,
    this.textAlign,
    this.style,
    this.fontSize,
    super.key,
  });

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

    return Focus(
      onFocusChange: (hasFocus) {
        setState(() => isHovering = hasFocus);
      },
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: (_) => setState(() => isHovering = true),
        onExit: (_) => setState(() => isHovering = false),
        child: GestureDetector(
          onTap: widget.onPressed,
          child: _RetroLinkTextWidget(
            widget.label,
            isHovering: isHovering,
            lineOverhang: widget.lineOverhang,
            style: style,
            textAlign: textAlign,
            textDirection: textDirection,
          ),
        ),
      ),
    );
  }
}

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

class _RetroLinkRenderObject extends RenderBox {
  _RetroLinkRenderObject({
    required TextPainter textPainter,
    required bool isHovering,
    required double lineOverhang,
  })  : _textPainter = textPainter,
        _isHovering = isHovering,
        _lineOverhang = lineOverhang;

  late TextPainter _textPainter;
  late bool _isHovering;
  late double _lineOverhang;

  final _spaceFromBaseline = 2;
  final _lineWidth = 2;

  set textPainter(TextPainter painter) {
    if (_textPainter == painter) return;
    _textPainter = painter;
    markNeedsLayout();

    if (_textPainter.plainText != painter.plainText) {
      markNeedsSemanticsUpdate();
    }
  }

  set isHovering(bool value) {
    if (_isHovering == value) return;
    _isHovering = value;
    markNeedsLayout();
    markNeedsSemanticsUpdate();
  }

  set lineOverhang(double value) {
    if (_lineOverhang == value) return;
    _lineOverhang = value;
    markNeedsLayout();
  }

  @override
  void describeSemanticsConfiguration(SemanticsConfiguration config) {
    config
      ..isLink = true
      ..isFocusable = true
      ..isFocused = _isHovering
      ..value = _textPainter.plainText
      ..textDirection = _textPainter.textDirection;
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    final newOffset = offset.translate(_lineOverhang, 0);
    _textPainter.paint(context.canvas, newOffset);

    final left =
        newOffset.dx + longestLine.left - (_isHovering ? _lineOverhang : 0);
    final right = left + longestLine.width;
    final height = _textPainter.height + _spaceFromBaseline;

    final baseStart = Offset(left, height);
    final baseEnd = Offset(
        right + (_isHovering ? _lineOverhang : 0.0) * 2, height + _lineWidth);

    final color = _textPainter.text?.style?.color ?? Colors.black;

    context.canvas.drawRect(
      Rect.fromPoints(baseStart, baseEnd),
      Paint()
        ..color = color
        ..style = PaintingStyle.fill,
    );
  }

  @override
  void performLayout() {
    if (constraints.hasTightWidth) {
      final sizeFromConstraints = constraints.maxWidth - 2 * _lineOverhang;
      _layoutText(minWidth: sizeFromConstraints, maxWidth: sizeFromConstraints);

      size = _computedSize(constraints);
    } else {
      _layoutText();

      final sizeFromLongestLine = longestLine.width + 2 * _lineOverhang;
      final smallerConstraints =
          constraints.copyWith(maxWidth: sizeFromLongestLine);
      size = _computedSize(smallerConstraints);
    }
  }

  LineMetrics get longestLine => (_textPainter.computeLineMetrics()
        ..sort((a, b) {
          if (a.width == b.width) return 0;
          return a.width > b.width ? 1 : -1;
        }))
      .last;

  Size _computedSize(BoxConstraints constraints) {
    return Size(
      constraints.maxWidth,
      _textPainter.height + _lineWidth + _spaceFromBaseline,
    );
  }

  void _layoutText({double minWidth = 0.0, double maxWidth = double.infinity}) {
    _textPainter.layout(minWidth: minWidth, maxWidth: maxWidth);
  }
}
