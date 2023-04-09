import 'dart:ui';
import 'package:field_companion/common_widgets/report/progress_indicator.dart';
import 'package:flutter/material.dart' hide ProgressIndicator;

class TimeProgress extends StatelessWidget {
  const TimeProgress({
    super.key,
    required this.progress,
  });

  final double progress;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Row(
          // TODO: Replace the superscript;
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              "25",
              style: TextStyle(
                fontSize: 20,
                fontFamily: 'Heebo',
                fontVariations: [
                  FontVariation(
                    "wght",
                    600,
                  ),
                ],
              ),
            ),
            Text(
              "25",
              style: TextStyle(
                fontSize: 12,
                fontFamily: 'Heebo',
                fontVariations: [
                  FontVariation(
                    "wght",
                    600,
                  ),
                ],
              ),
            ),
          ],
        ),
        ProgressIndicator(
          percentage: progress,
        ),
      ],
    );
  }
}
