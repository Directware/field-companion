import 'dart:math' as math;

import 'package:flutter/material.dart';

class ProgressIndicatorPainter extends CustomPainter {
  ProgressIndicatorPainter({
    required this.progress,
    required this.strokeWidth,
    required this.startingColor,
    required this.shadowColor,
    required this.endingColor,
    required this.backgroundColor,
  });

  final double progress;
  final double strokeWidth;
  final Color startingColor;
  final Color shadowColor;
  final Color endingColor;
  final Color backgroundColor;

  @override
  void paint(Canvas canvas, Size size) {
    const startAngle = -math.pi / 2;
    const gradientStartAngle = 3 * math.pi / 2;
    final center = Offset(size.width / 2, size.height / 2);
    final radius = math.min(size.width, size.height) / 2;
    final angle = 2 * math.pi * math.min(progress, 1);
    final rect = Rect.fromCircle(center: center, radius: radius);
    final capRad = strokeWidth / 2 / radius;

    final backgroundPaint = Paint()
      ..color = backgroundColor
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    final shadowPaint = Paint()
      ..color = shadowColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 3);

    final gradient = SweepGradient(
      startAngle: gradientStartAngle - capRad,
      endAngle: 7 * math.pi / 2 - (capRad * 2),
      tileMode: TileMode.repeated,
      colors: [startingColor, endingColor],
    );

    final foregroundPaint = Paint()
      ..shader = gradient.createShader(rect)
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

    if (progress > 0.95) {
      final endCapPaint = Paint()
        ..color = endingColor
        ..strokeWidth = strokeWidth
        ..style = PaintingStyle.stroke
        ..strokeCap = StrokeCap.round;

      canvas.drawArc(
        rect,
        startAngle + angle - capRad,
        capRad,
        false,
        endCapPaint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant ProgressIndicatorPainter oldDelegate) {
    return oldDelegate.progress != progress ||
        oldDelegate.strokeWidth != strokeWidth ||
        oldDelegate.startingColor != startingColor ||
        oldDelegate.shadowColor != shadowColor ||
        oldDelegate.endingColor != endingColor ||
        oldDelegate.backgroundColor != backgroundColor;
  }
}
