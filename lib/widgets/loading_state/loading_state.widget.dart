import 'dart:math';

import 'package:flutter/material.dart';

class LoadingState extends StatefulWidget {
  const LoadingState({
    super.key,
    this.color = Colors.black,
    this.size = 8,
    this.maxHeight = 24,
  });

  const LoadingState.white({
    super.key,
    this.size = 8,
    this.maxHeight = 24,
  }) : color = Colors.white;

  /// Cor do pixel.
  final Color color;

  /// Tamanho do pixel
  final double size;

  /// Altura máxima do "pulo" do pixel.
  final double maxHeight;

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
    return SizedBox(
      width: widget.size * 1.42,
      height: widget.maxHeight,
      child: Center(
        child: Transform.translate(
          offset: Offset(0, widget.size - bottomDistance),
          child: Transform.rotate(
            angle: rotation,
            child: Container(
              width: widget.size,
              height: widget.size,
              constraints:
                  BoxConstraints(maxWidth: widget.size, maxHeight: widget.size),
              color: widget.color,
            ),
          ),
        ),
      ),
    );
  }
}
