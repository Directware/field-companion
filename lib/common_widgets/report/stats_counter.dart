import 'package:field_companion/color_palette.dart';
import 'package:flutter/material.dart';

class StatsCounter extends StatelessWidget {
  const StatsCounter({super.key, required this.amount, required this.icon});

  final int amount;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
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
            Text(
              amount.toString(),
              textAlign: TextAlign.end,
              style: const TextStyle(
                fontSize: 18.0,
                letterSpacing: 0.17,
                fontFamily: 'Heebo',
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
