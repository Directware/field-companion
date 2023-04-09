import 'package:field_companion/color_palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class StepperWidget extends ConsumerWidget {
  const StepperWidget({
    required this.title,
    required this.icon,
  });

  final String title;
  final Icon icon;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // TODO: add Provider
    final value = 0;
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8, bottom: 16),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(9.0),
            child: icon,
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: Text(title),
          ),
          Container(
            width: 80,
            decoration: BoxDecoration(
              color: ColorPalette.grey2Opacity24,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Column(
              children: [
                /// 7.0 Padding because the symbol is bigger than the minus symbol; now its symmetric;
                Padding(
                  padding: const EdgeInsets.all(7.0),
                  child: IconButton(
                    onPressed: () {
                      // ref.read(providerName.notifier).set(value);
                      // TODO: add plus action
                    },
                    icon: const Icon(
                      FeatherIcons.plus,
                      color: ColorPalette.grey2,
                    ),
                    iconSize: 20,
                  ),
                ),

                Text(
                  value.toString(),
                  style: const TextStyle(
                    fontFamily: "Heebo",
                    fontSize: 20,
                    height: 1.2,
                    letterSpacing: 0.4,
                  ),
                ),

                IconButton(
                  onPressed: () {
                    // ref.read(providerName.notifier).set(value);
                    // TODO: add minus action
                  },
                  icon: const Icon(
                    FeatherIcons.minus,
                    color: ColorPalette.grey2,
                  ),
                  iconSize: 20,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
