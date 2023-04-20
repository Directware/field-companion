import 'package:field_companion/features/core/infrastructure/models/color_palette.dart';
import 'package:field_companion/features/core/presentation/widgets/common/animated_number.dart';
import 'package:flutter/material.dart';

class StatsCounter extends StatelessWidget {
  const StatsCounter(
      {super.key, required this.value, required this.icon, this.onTap});

  final int value;
  final IconData icon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(6),
      child: Container(
        decoration: BoxDecoration(
          color: ColorPalette.grey2Opacity20,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                icon,
                color: ColorPalette.grey2,
                size: 20,
              ),
              const SizedBox(width: 8),
              AnimatedNumber(
                number: value,
                builder: (value) => Text(
                  value.toString(),
                  textAlign: TextAlign.end,
                  style: const TextStyle(
                    fontSize: 18.0,
                    letterSpacing: 0.17,
                    fontFamily: 'Heebo',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
