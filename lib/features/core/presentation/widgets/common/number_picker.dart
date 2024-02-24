import 'package:field_companion/features/core/infrastructure/models/color_palette.dart';
import 'package:field_companion/features/core/presentation/widgets/common/wheel_picker.dart';
import 'package:flutter/material.dart';

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
          child: WheelPicker.number(
            height: 200,
            min: min,
            max: max,
            initialValue: value,
            value: value,
            step: step,
            onChanged: (value) => onChanged(value),
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
        ),
      ],
    );
  }
}
