import 'package:field_companion/color_palette.dart';
import 'package:field_companion/common_widgets/progress_painter.dart';
import 'package:flutter/material.dart' hide ProgressIndicator;

class ProgressIndicator extends StatelessWidget {
  const ProgressIndicator({
    super.key,
    required this.progress,
  });

  final double progress;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 72,
      height: 72,
      child: TweenAnimationBuilder<double>(
        duration: const Duration(milliseconds: 550),
        curve: Curves.easeInOut,
        tween: Tween<double>(
          begin: 0,
          end: progress,
        ),
        builder: (context, value, _) => CustomPaint(
          painter: ProgressIndicatorPainter(
            progress: value,
            strokeWidth: 6,
            startingColor: ColorPalette.greenProgressStart,
            shadowColor: ColorPalette.greenProgressStartOpacity05,
            endingColor: ColorPalette.greenProgressEnd,
            backgroundColor: ColorPalette.grey2Opacity30,
          ),
        ),
      ),
    );
  }
}
