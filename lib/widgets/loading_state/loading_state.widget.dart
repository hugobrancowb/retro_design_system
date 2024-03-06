part of retro_design_system;

class LoadingState extends StatefulWidget {
  const LoadingState({
    super.key,
    this.color = Colors.black,
    this.squareSize = 8,
    this.height = 24,
  });

  const LoadingState.white({
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
  State<LoadingState> createState() => _LoadingStateState();
}

class _LoadingStateState extends State<LoadingState>
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

  /// Altura do pixel.
  double bottomDistance = 0;

  /// Rotação do pixel.
  double rotation = 0;

  /// Animação aplicada no pixel (quadrado).
  void animation() {
    double gravity = -100;
    double velConst = -(gravity * 0.5);

    setState(() {
      double time = animationController.value;
      rotation = time <= 0.25 ? time * pi : pi;
      bottomDistance = (velConst * time) + (gravity * time * time) / 2;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: Use [CustomPainter] instead of several transforms
    return SizedBox(
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
              color: widget.color,
            ),
          ),
        ),
      ),
    );
  }
}
