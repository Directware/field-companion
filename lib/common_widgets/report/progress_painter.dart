import 'dart:math' as math;
import 'package:flutter/material.dart';

class ProgressIndicatorPainter extends CustomPainter {
  ProgressIndicatorPainter({
    required this.hours,
    required this.minutes,
    required this.percentage,
    required this.strokeWidth,
    required this.startingColor,
    required this.endingColor,
    required this.backgroundColor,
  });

  final int hours;
  final int minutes;
  final double percentage;
  final double strokeWidth;
  final Color startingColor;
  final Color endingColor;
  final Color backgroundColor;

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = math.min(size.width, size.height) / 2;
    final angle = 2 * math.pi * (percentage / 100);

    /// background Circle
    final backgroundPaint = Paint();
    backgroundPaint.color = backgroundColor;
    backgroundPaint.strokeWidth = strokeWidth;
    backgroundPaint.style = PaintingStyle.stroke;
    canvas.drawCircle(center, radius, backgroundPaint);

    /// progress circle(foreground)
    final progressBarPaint = Paint();
    final shader = RadialGradient(
      colors: [startingColor, endingColor],
      center: Alignment.topCenter,
    ).createShader(Rect.fromCircle(center: center, radius: radius));

    progressBarPaint.shader = shader;
    progressBarPaint.color = startingColor;
    progressBarPaint.strokeWidth = strokeWidth;
    progressBarPaint.style = PaintingStyle.stroke;
    progressBarPaint.strokeCap = StrokeCap.round;

    /// darw
    canvas.drawArc(Rect.fromCircle(center: center, radius: radius),
        -math.pi / 2, angle, false, progressBarPaint);

    /// hours text in the center
    final textSpan = TextSpan(
      text: hours.toString(),
      style: const TextStyle(
        fontSize: 22.0,
        fontFamily: 'Heebo',
        // TODO: Choose the correct fontWeight
        fontWeight: FontWeight.bold,
      ),
    );
    final textPainter = TextPainter(
      text: textSpan,
      textDirection: TextDirection.ltr,
    );
    textPainter.layout();
    textPainter.paint(
      canvas,
      Offset(
        center.dx - textPainter.width / 1.5,
        center.dy - textPainter.height / 2,
      ),
    );
    // minutes as a Superscript
    final textSpan2 = TextSpan(
      text: minutes.toString(),
      style: const TextStyle(
        fontSize: 12.0,
        fontFamily: 'Heebo',
        // TODO: Choose the correct fontWeight
        fontWeight: FontWeight.bold,
      ),
    );
    final textPainter2 = TextPainter(
      text: textSpan2,
      textDirection: TextDirection.ltr,
    );
    textPainter2.layout();
    textPainter2.paint(
      canvas,
      Offset(
        center.dx + textPainter.width / 3,
        center.dy - textPainter.height / 2,
      ),
    );

    /// together rendered hours and minutes
    /*
    /// the text is in the middle of the circle, but the minutes aren't a superscript
    final textSpan = TextSpan(
      text: hours.toString(),
      style: const TextStyle(
        fontSize: 25.0,
        fontFamily: 'Heebo',
      ),
      children: [
        TextSpan(
          text: minutes.toString(),
          style: const TextStyle(
            fontSize: 15.0,
            fontFamily: 'Heebo',
          ),
        ),
      ],
    );

    final textPainter = TextPainter(
      text: textSpan,
      textDirection: TextDirection.ltr,
    );
    */
  }

  @override
  bool shouldRepaint(covariant ProgressIndicatorPainter oldDelegate) {
    return oldDelegate.percentage != percentage;
  }
}
