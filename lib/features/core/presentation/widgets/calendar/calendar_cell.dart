import 'dart:ui';

import 'package:field_companion/features/core/infrastructure/models/color_palette.dart';
import 'package:flutter/material.dart';

class CalendarCell extends StatelessWidget {
  const CalendarCell({
    super.key,
    required this.date,
    required this.onTap,
    this.disabled = false,
    this.selected = false,
    this.highlight = false,
  });

  final DateTime date;
  final bool disabled;
  final bool selected;
  final bool highlight;
  final GestureTapCallback onTap;

  Color _getColor({required bool active}) {
    if (highlight) {
      return ColorPalette.green;
    } else if (active) {
      return Colors.white;
    } else {
      return ColorPalette.grey2;
    }
  }

  List<FontVariation>? _getVariations({required bool active}) {
    if (active || selected) {
      return [
        const FontVariation("wght", 500),
      ];
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final active = DateTime(now.year, now.month, now.day) == date;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(19),
        child: Opacity(
          opacity: disabled ? 0.2 : 1,
          child: SizedBox(
            width: 38,
            height: 38,
            child: Stack(
              children: [
                TweenAnimationBuilder<double>(
                  tween: Tween(begin: 0, end: selected ? 1 : 0),
                  duration: const Duration(milliseconds: 150),
                  builder: (context, opacity, _) => Opacity(
                    opacity: opacity,
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
                ),
                TweenAnimationBuilder<double>(
                  tween:
                      Tween(begin: highlight ? 1 : 0, end: highlight ? 1 : 0),
                  duration: const Duration(milliseconds: 150),
                  builder: (context, opacity, _) => Opacity(
                    opacity: opacity,
                    child: Center(
                      child: Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: ColorPalette.greenOpacity20,
                        ),
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    date.day.toString(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      letterSpacing: 0.4,
                      color: _getColor(active: active),
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
                        color: _getColor(active: active),
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