import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:field_companion/features/core/infrastructure/models/color_palette.dart';
import 'package:flutter/material.dart';
import 'package:wheel_chooser/wheel_chooser.dart';

class MonthPicker extends StatelessWidget {
  const MonthPicker({
    required this.title,
    required this.value,
    required this.onChanged,
  });

  final String title;
  final DateTime value;
  final ValueChanged<DateTime> onChanged;

  @override
  Widget build(BuildContext context) {
    int month = value.month;
    int year = value.year;
    return Column(
      mainAxisSize: MainAxisSize.min,
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
          decoration: BoxDecoration(
            color: ColorPalette.grey2Opacity24,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(width: 16),
              WheelChooser.choices(
                choices: List.generate(
                  12,
                  (index) => WheelChoice(
                    value: index + 1,
                    title: DateFormat('MMMM').format(DateTime(2000, index + 1)),
                  ),
                ),
                startPosition: value.month - 1,
                listHeight: 200,
                listWidth: 120,
                onChoiceChanged: (value) => onChanged(
                  DateTime(year, value as int),
                ),
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
              ),
              WheelChooser.integer(
                maxValue: 2500,
                minValue: 1900,
                listHeight: 200,
                listWidth: 80,
                initValue: value.year,
                onValueChanged: (value) => onChanged(
                  DateTime(value as int, month),
                ),
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
              ),
              const SizedBox(width: 16),
            ],
          ),
        )
      ],
    );
  }
}
