// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:math' as math;

import '../cubit/get_meal_recommendation_cubit.dart';

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

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final getFoodRecommedationCuubit =
        context.watch<GetMealRecommendationCubit>();
    return GestureDetector(
      onTap:
          getFoodRecommedationCuubit.state is GettingMealRecommendation
              ? null
              : widget.onPressed,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Wavy ripple effect
          AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              return CustomPaint(
                painter: SiriWavePainter(animationValue: _controller.value),
                size: Size(widget.size * 2, widget.size * 2),
              );
            },
          ),
          // Main button
          Container(
            width: widget.size,
            height: widget.size,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color:
                  getFoodRecommedationCuubit.state is GettingMealRecommendation
                      ? Colors.grey.withOpacity(0.5)
                      : null,
              gradient:
                  getFoodRecommedationCuubit.state is GettingMealRecommendation
                      ? null
                      : RadialGradient(
                        colors: [
                          Color(0xFFFFB347).withOpacity(0.7),
                          Color(0xFF00A875).withOpacity(0.9), // Lighter Teal
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
            child: const Icon(
              Icons.food_bank_rounded,
              color: Colors.white,
              size: 30,
            ),
          ),
        ],
      ),
    );
  }
}

class SiriWavePainter extends CustomPainter {
  final double animationValue;

  SiriWavePainter({required this.animationValue});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    const waveCount = 3; // Number of concentric waves
    const maxRadius = 50.0; // Maximum radius of the outermost wave
    const waveGap = 15.0; // Gap between waves

    for (int i = 0; i < waveCount; i++) {
      final paint =
          Paint()
            ..style = PaintingStyle.fill
            ..shader = SweepGradient(
              colors: [
                Color(0xFF007243).withOpacity(0.5 - i * 0.1), // Dark Teal-Green
                Color(0xFF00A875).withOpacity(0.4 - i * 0.1), // Lighter Teal
                Color(0xFFFFB347).withOpacity(0.5 - i * 0.1),
                Color(0xFF007243).withOpacity(0.5 - i * 0.1),
                // Colors.blue.withOpacity(0.5 - i * 0.1),
                // Colors.purple.withOpacity(0.4 - i * 0.1),
                // Colors.blue.withOpacity(0.5 - i * 0.1),
              ],
              transform: GradientRotation(animationValue * 2 * math.pi),
            ).createShader(Rect.fromCircle(center: center, radius: maxRadius));

      final path = Path();
      final baseRadius = maxRadius - i * waveGap;
      final points = <Offset>[];

      // Calculate wave points using sine function
      for (double angle = 0; angle <= 2 * math.pi; angle += 0.05) {
        final waveAmplitude =
            5.0 * (1 - i * 0.3); // Decrease amplitude for inner waves
        final waveOffset =
            animationValue * 2 * math.pi +
            i * math.pi / 2; // Phase shift per wave
        final radius =
            baseRadius + waveAmplitude * math.sin(4 * angle + waveOffset);
        final x = center.dx + radius * math.cos(angle);
        final y = center.dy + radius * math.sin(angle);
        points.add(Offset(x, y));
      }

      // Create the wavy path
      path.moveTo(points[0].dx, points[0].dy);
      for (int j = 1; j < points.length; j++) {
        path.lineTo(points[j].dx, points[j].dy);
      }
      path.close();

      canvas.drawPath(path, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
