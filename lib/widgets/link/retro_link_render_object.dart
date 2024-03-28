part of retro_design_system;

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

  final _spaceFromBaseline = 1;
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
    final height = newOffset.dy + _textPainter.height + _spaceFromBaseline;

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
