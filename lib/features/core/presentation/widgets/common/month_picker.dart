import 'package:easy_localization/easy_localization.dart';
import 'package:field_companion/features/core/infrastructure/models/color_palette.dart';
import 'package:field_companion/features/core/infrastructure/models/wheel_picker_item.dart';
import 'package:field_companion/features/core/presentation/widgets/common/wheel_picker.dart';
import 'package:flutter/material.dart';

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
    final int month = value.month;
    final int year = value.year;
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
              WheelPicker.item(
                items: List.generate(
                  12,
                  (index) => WheelPickerItem(
                    DateFormat('MMM').format(DateTime(2000, index + 1)),
                    index + 1,
                  ),
                ),
                initialValue: value.month - 1,
                height: 200,
                width: 47,
                offAxisFraction: -0.5,
                textAlign: TextAlign.right,
                onChanged: (value) => onChanged(
                  DateTime(year, value as int),
                ),
                unSelectTextStyle: const TextStyle(
                  fontFamily: "Heebo",
                  fontSize: 14,
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
              const SizedBox(width: 8),
              WheelPicker.number(
                min: 1900,
                height: 200,
                width: 60,
                offAxisFraction: 0.5,
                textAlign: TextAlign.left,
                initialValue: value.year,
                onChanged: (value) => onChanged(
                  DateTime(value, month),
                ),
                unSelectTextStyle: const TextStyle(
                  fontFamily: "Heebo",
                  fontSize: 14,
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
        ),
      ],
    );
  }
}
