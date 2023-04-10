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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              "52",
              style: TextStyle(
                fontSize: 22,
                letterSpacing: 0.21,
                fontFamily: 'Heebo',
                fontVariations: [
                  FontVariation(
                    "wght",
                    500,
                  ),
                ],
              ),
            ),
            SizedBox(width: 2),
            Text(
              "30",
              style: TextStyle(
                fontSize: 12,
                letterSpacing: 0.11,
                fontFamily: 'Heebo',
                height: 1.82,
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
