part of retro_design_system;

class RetroLoadingIndicator extends StatefulWidget {
  const RetroLoadingIndicator({
    super.key,
    this.color = Colors.black,
    this.squareSize = 8,
    this.height = 24,
  });

  const RetroLoadingIndicator.white({
    super.key,
    this.squareSize = 8,
    this.height = 24,
  }) : color = Colors.white;

  /// Cor do pixel.
  final Color color;

  /// Tamanho do pixel
  final double squareSize;

  /// Altura máxima do "pulo" do pixel.
  final double height;

  @override
  State<RetroLoadingIndicator> createState() => _RetroLoadingIndicatorState();
}

class _RetroLoadingIndicatorState extends State<RetroLoadingIndicator>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )
      ..addListener(animation)
      ..repeat();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  /// Square's distance from the bottom.
  double bottomDistance = 0;

  /// Square's rotation (radians).
  double rotation = 0;

  static const _gravity = -100;
  static const _velConst = -(_gravity * 0.5);

  /// Square's animation.
  void animation() {
    setState(() {
      double time = animationController.value;
      // time = 0;
      rotation = time <= 0.5 ? time * pi : pi * .5;
      bottomDistance = (_velConst * time) + (_gravity * time * time) / 2;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: Use [CustomPainter] instead of several transforms

    final newWidget = CustomPaint(
      painter: _RetroLoadingPainter(
        color: widget.color,
        squareSize: widget.squareSize,
        bottomDistance: bottomDistance,
        rotation: rotation,
      ),
      size: Size(widget.squareSize * 1.42, widget.height),
      isComplex: true,
    );

    final oldWidget = SizedBox(
      width: widget.squareSize * 1.42,
      height: widget.height,
      child: Center(
        child: Transform.translate(
          offset: Offset(0, widget.squareSize - bottomDistance),
          child: Transform.rotate(
            angle: rotation,
            child: Container(
              width: widget.squareSize,
              height: widget.squareSize,
              constraints: BoxConstraints(
                maxWidth: widget.squareSize,
                maxHeight: widget.squareSize,
              ),
              color: Colors.red.withOpacity(0.7),
            ),
          ),
        ),
      ),
    );

    // return newWidget;
    return Stack(children: [newWidget, oldWidget]);
  }
}

class _RetroLoadingPainter extends CustomPainter {
  _RetroLoadingPainter({
    required this.squareSize,
    required this.color,
    required this.bottomDistance,
    required double rotation,
  })  : alpha = rotation,
        omega = (pi / 2) - rotation;

  final double squareSize;
  final Color color;
  final double bottomDistance;
  final double alpha;
  final double omega;

  @override
  void paint(Canvas canvas, Size size) {
    final ax = size.width / 2 + squareSize / 2 - (squareSize * cos(alpha));
    final ay = size.height - bottomDistance;
    final bx = cos(alpha) * squareSize + ax;
    final by = sin(alpha) * squareSize + ay;
    final dx = ax - cos(omega) * squareSize;
    final dy = ay + sin(omega) * squareSize;
    final cx = cos(alpha) * squareSize + dx;
    final cy = sin(alpha) * squareSize + dy;

    final squarePath = Path()
      ..moveTo(ax, ay)
      ..lineTo(bx, by)
      ..lineTo(cx, cy)
      ..lineTo(dx, dy);

    canvas.drawPath(squarePath, Paint()..color = color);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }
}
