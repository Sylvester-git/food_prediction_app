// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'dart:math' as math;

class RecommendationButton extends StatefulWidget {
  const RecommendationButton({super.key, this.onPressed, this.size = 60.0});
  final VoidCallback? onPressed;
  final double size;

  @override
  State<RecommendationButton> createState() => _RecommendationButtonState();
}

class _RecommendationButtonState extends State<RecommendationButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat();

    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 1.5,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPressed,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Pulsing wave effect
          AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              return CustomPaint(
                painter: SiriWavePainter(
                  animationValue: _controller.value,
                  scale: _scaleAnimation.value,
                ),
                size: Size(widget.size * 1.5, widget.size * 1.5),
              );
            },
          ),
          // Main button
          Container(
            width: widget.size,
            height: widget.size,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: RadialGradient(
                colors: [
                  Colors.white.withOpacity(0.9),
                  Colors.blueAccent.withOpacity(0.7),
                ],
                stops: const [0.0, 1.0],
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: const Icon(Icons.mic, color: Colors.white, size: 30),
          ),
        ],
      ),
    );
  }
}

class SiriWavePainter extends CustomPainter {
  final double animationValue;
  final double scale;

  SiriWavePainter({required this.animationValue, required this.scale});

  @override
  void paint(Canvas canvas, Size size) {
    final paint =
        Paint()
          ..style = PaintingStyle.fill
          ..shader = SweepGradient(
            colors: [
              Colors.blue.withOpacity(0.4),
              Colors.purple.withOpacity(0.3),
              Colors.blue.withOpacity(0.4),
            ],
            transform: GradientRotation(animationValue * 2 * math.pi),
          ).createShader(
            Rect.fromCircle(
              center: Offset(size.width / 2, size.height / 2),
              radius: size.width / 2,
            ),
          );

    canvas.drawCircle(
      Offset(size.width / 2, size.height / 2),
      (size.width / 2) * scale,
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
