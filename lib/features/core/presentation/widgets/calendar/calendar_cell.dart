
import 'package:field_companion/features/core/infrastructure/models/color_palette.dart';
import 'package:flutter/material.dart';

class CalendarCell extends StatefulWidget {
  const CalendarCell({
    super.key,
    required this.date,
    required this.onTap,
    this.disabled = false,
    this.selected = false,
    this.highlight = false,
    this.active = false,
  });

  final DateTime date;
  final bool disabled;
  final bool selected;
  final bool highlight;
  final bool active;
  final GestureTapCallback onTap;

  @override
  State<CalendarCell> createState() => _CalendarCellState();
}

class _CalendarCellState extends State<CalendarCell>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  Animation<Color?>? _animationBackgroundColor;
  Animation<Color?>? _animationTextColor;
  Animation<double?>? _animationSelection;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 150),
      vsync: this,
    );
    _controller.addListener(() {
      setState(() {});
    });
    onStateChanged();
  }

  @override
  void didUpdateWidget(CalendarCell oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.selected != oldWidget.selected ||
        widget.highlight != oldWidget.highlight) {
      onStateChanged();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Color _getTextColor() {
    if (widget.highlight) {
      return ColorPalette.green;
    } else if (widget.active) {
      return Colors.white;
    } else {
      return ColorPalette.grey2;
    }
  }

  Color _getBackgroundColor() {
    if (widget.highlight) {
      return ColorPalette.greenOpacity20;
    } else {
      return Colors.transparent;
    }
  }

  List<FontVariation>? _getVariations({required bool active}) {
    if (active || widget.selected) {
      return [
        const FontVariation("wght", 500),
      ];
    }
    return null;
  }

  void onStateChanged() {
    _animationBackgroundColor = ColorTween(
      begin: _animationBackgroundColor?.value ?? _getBackgroundColor(),
      end: _getBackgroundColor(),
    ).animate(_controller);

    _animationTextColor = ColorTween(
      begin: _animationTextColor?.value ?? _getTextColor(),
      end: _getTextColor(),
    ).animate(_controller);

    _animationSelection = Tween<double>(
      begin: _animationSelection?.value ?? 0,
      end: widget.selected ? 1 : 0,
    ).animate(_controller);

    _controller.forward(from: 0);
  }

  void onSelectedChanged() {
    _animationBackgroundColor = ColorTween(
      begin: _animationBackgroundColor?.value ?? _getBackgroundColor(),
      end: _getBackgroundColor(),
    ).animate(_controller);
  }

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final active = DateTime(now.year, now.month, now.day) == widget.date;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: widget.onTap,
        borderRadius: BorderRadius.circular(19),
        child: Opacity(
          opacity: widget.disabled ? 0.2 : 1,
          child: SizedBox(
            width: 38,
            height: 38,
            child: Stack(
              children: [
                Opacity(
                  opacity: _animationSelection?.value ?? 0,
                  child: Center(
                    child: Container(
                      width: 38,
                      height: 38,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.white,
                        ),
                        borderRadius: BorderRadius.circular(19),
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: _animationBackgroundColor?.value,
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    widget.date.day.toString(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      letterSpacing: 0.4,
                      color: _animationTextColor?.value,
                      fontFamily: "Heebo",
                      fontVariations: _getVariations(active: active),
                    ),
                  ),
                ),
                if (active)
                  Positioned(
                    bottom: 5,
                    left: 17,
                    child: Container(
                      width: 4,
                      height: 4,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(1),
                        color: _animationTextColor?.value,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
