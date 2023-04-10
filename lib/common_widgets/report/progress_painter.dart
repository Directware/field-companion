import 'dart:math' as math;

import 'package:flutter/material.dart';

class ProgressIndicatorPainter extends CustomPainter {
  ProgressIndicatorPainter({
    required this.percentage,
    required this.strokeWidth,
    required this.startingColor,
    required this.shadowColor,
    required this.endingColor,
    required this.backgroundColor,
  });

  final double percentage;
  final double strokeWidth;
  final Color startingColor;
  final Color shadowColor;
  final Color endingColor;
  final Color backgroundColor;

  @override
  void paint(Canvas canvas, Size size) {
    const startAngle = -math.pi / 2;
    final center = Offset(size.width / 2, size.height / 2);
    final radius = math.min(size.width, size.height) / 2;
    final angle = 2 * math.pi * (percentage / 100);
    final rect = Rect.fromCircle(center: center, radius: radius);

    final backgroundPaint = Paint()
      ..color = backgroundColor
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    final shadowPaint = Paint()
      ..color = shadowColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 2.5);

    final foregroundPaint = Paint()
      ..shader = RadialGradient(
        colors: [startingColor, endingColor],
        center: Alignment.topCenter,
      ).createShader(Rect.fromCircle(center: center, radius: radius))
      ..color = startingColor
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    canvas.drawCircle(center, radius, backgroundPaint);
    canvas.drawArc(
      rect,
      startAngle,
      angle,
      false,
      shadowPaint,
    );
    canvas.drawArc(
      rect,
      startAngle,
      angle,
      false,
      foregroundPaint,
    );
  }

  @override
  bool shouldRepaint(covariant ProgressIndicatorPainter oldDelegate) {
    return oldDelegate.percentage != percentage;
  }
}
