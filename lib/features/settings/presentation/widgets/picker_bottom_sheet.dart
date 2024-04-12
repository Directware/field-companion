import 'dart:ui';

import 'package:field_companion/features/core/infrastructure/models/color_palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

class PickerBottomSheet<T> extends StatelessWidget {
  const PickerBottomSheet({
    super.key,
    required this.items,
    required this.selectValue,
    required this.onSelected,
  });

  final List<SelectItem<T>> items;
  final T selectValue;
  final Function(T) onSelected;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        ClipRRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(
              decoration: BoxDecoration(
                color: ColorPalette.grey2Opacity08,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    height: 1,
                    color: ColorPalette.whiteOpacity10,
                  ),
                  for (final item in items)
                    InkWell(
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: item.value == selectValue
                              ? ColorPalette.grey2Opacity08
                              : Colors.transparent,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              item.label,
                              style: const TextStyle(color: Colors.white),
                            ),
                            if (item.value == selectValue)
                              const Icon(
                                FeatherIcons.check,
                                color: Colors.white,
                              ),
                          ],
                        ),
                      ),
                      onTap: () {
                        onSelected(item.value);
                        Navigator.of(context).pop();
                      },
                    ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class SelectItem<T> {
  const SelectItem({required this.label, required this.value});

  final String label;
  final T value;
}
