import 'dart:ui';

import 'package:field_companion/features/core/infrastructure/models/color_palette.dart';
import 'package:flutter/material.dart';
import 'package:wheel_chooser/wheel_chooser.dart';

class NumberPicker extends StatelessWidget {
  const NumberPicker({
    required this.title,
    required this.value,
    this.min = 0,
    this.max,
    this.step = 1,
    required this.onChanged,
  });

  final String title;
  final int value;
  final int min;
  final int? max;
  final int step;
  final ValueChanged<int> onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: const TextStyle(
            fontFamily: "Heebo",
            fontSize: 16,
            height: 1.25,
            overflow: TextOverflow.ellipsis,
            fontVariations: [
              FontVariation("wght", 400),
            ],
            letterSpacing: 0.4,
          ),
        ),
        const SizedBox(height: 16),
        Container(
          width: 80,
          decoration: BoxDecoration(
            color: ColorPalette.grey2Opacity24,
            borderRadius: BorderRadius.circular(10),
          ),
          child: SizedBox(
              height: 200,
              child: WheelChooser.integer(
                maxValue: max ?? 1000,
                minValue: min,
                initValue: value,
                step: step,
                onValueChanged: (value) => onChanged(value as int),
                unSelectTextStyle: const TextStyle(
                  fontFamily: "Heebo",
                  fontSize: 16,
                  overflow: TextOverflow.ellipsis,
                  fontVariations: [
                    FontVariation("wght", 400),
                  ],
                  color: ColorPalette.grey2,
                  letterSpacing: 0.4,
                ),
                selectTextStyle: const TextStyle(
                  fontFamily: "Heebo",
                  fontSize: 16,
                  overflow: TextOverflow.ellipsis,
                  fontVariations: [
                    FontVariation("wght", 400),
                  ],
                  letterSpacing: 0.4,
                ),
              )),
        )
      ],
    );
  }
}
