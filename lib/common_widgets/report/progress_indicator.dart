import 'dart:math' as math;

import 'package:field_companion/color-palette.dart';
import 'package:field_companion/common_widgets/report/progress_painter.dart';
import 'package:flutter/material.dart';

class Progressindicator extends StatelessWidget {
  Progressindicator({super.key, required this.percentage});

  double percentage;
  int hours = 25;
  int minutes = 30;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        /*
        // The percentage is wrongly positioned when the percentage is 100;
        Center(
          child: Padding(
            padding: const EdgeInsets.all(40.0),
            child: Text(
              percentage.toStringAsFixed(0),
              style: const TextStyle(
                fontSize: 25.0,
                fontFamily: 'Heebo',
              ),
            ),
          ),
        ),
       */
        Padding(
          padding: EdgeInsets.all(19.0),
          child: Center(
            child: SizedBox(
              width: 72,
              height: 72,
              child: CustomPaint(
                painter: ProgressIndicatorPainter(
                  hours: hours,
                  minutes: minutes,
                  percentage: percentage,
                  strokeWidth: 7,
                  startingColor: ColorPalette.greenProgressStart,
                  endingColor: ColorPalette.greenProgressEnd,
                  backgroundColor: ColorPalette.grey2Opacity30,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
