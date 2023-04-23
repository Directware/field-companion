import 'package:field_companion/features/core/infrastructure/models/color_palette.dart';
import 'package:field_companion/features/core/presentation/widgets/common/progress_painter.dart';
import 'package:flutter/material.dart' hide ProgressIndicator;

class ProgressIndicator extends StatefulWidget {
  const ProgressIndicator({
    super.key,
    required this.progress,
    required this.startingColor,
    required this.endingColor,
    required this.shadowColor,
    required this.backgroundColor,
  });

  final double progress;
  final Color shadowColor;
  final Color endingColor;
  final Color startingColor;
  final Color backgroundColor;

  @override
  State<ProgressIndicator> createState() => _ProgressIndicatorState();
}

class _ProgressIndicatorState extends State<ProgressIndicator>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  Animation<Color?>? _animationStartingColor;
  Animation<Color?>? _animationEndingColor;
  Animation<Color?>? _animationShadowColor;
  Animation<double>? _animationProgress;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 550),
      vsync: this,
    );

    onProgressChanged();
  }

  void onProgressChanged() {
    _animationProgress = Tween<double>(
            begin: _animationProgress?.value ?? 0, end: widget.progress)
        .animate(_controller);
    _animationStartingColor = ColorTween(
      begin: _animationStartingColor?.value ?? widget.startingColor,
      end: widget.startingColor,
    ).animate(_controller);
    _animationEndingColor = ColorTween(
      begin: _animationEndingColor?.value ?? widget.endingColor,
      end: widget.endingColor,
    ).animate(_controller);
    _animationShadowColor = ColorTween(
      begin: _animationShadowColor?.value ?? widget.shadowColor,
      end: widget.shadowColor,
    ).animate(_controller);

    _controller.forward(from: 0);
  }

  @override
  void didUpdateWidget(ProgressIndicator oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.progress != widget.progress ||
        oldWidget.startingColor != widget.startingColor ||
        oldWidget.endingColor != widget.endingColor ||
        oldWidget.shadowColor != widget.shadowColor) {
      onProgressChanged();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 72,
      height: 72,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return CustomPaint(
            painter: ProgressIndicatorPainter(
              progress: _animationProgress?.value ?? 0,
              strokeWidth: 6,
              startingColor:
                  _animationStartingColor?.value ?? widget.startingColor,
              shadowColor: _animationShadowColor?.value ?? widget.shadowColor,
              endingColor: _animationEndingColor?.value ?? widget.endingColor,
              backgroundColor: ColorPalette.grey2Opacity30,
            ),
          );
        },
      ),
    );
  }
}
