import 'package:field_companion/color_palette.dart';
import 'package:field_companion/common_widgets/report/progress_painter.dart';
import 'package:flutter/material.dart' hide ProgressIndicator;

class ProgressIndicator extends StatelessWidget {
  const ProgressIndicator({
    super.key,
    required this.percentage,
  });

  final double percentage;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 72,
      height: 72,
      child: CustomPaint(
        painter: ProgressIndicatorPainter(
          percentage: percentage,
          strokeWidth: 6,
          startingColor: ColorPalette.greenProgressStart,
          shadowColor: ColorPalette.greenProgressStartOpacity05,
          endingColor: ColorPalette.greenProgressEnd,
          backgroundColor: ColorPalette.grey2Opacity30,
        ),
      ),
    );
  }
}
