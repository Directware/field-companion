import 'package:flutter/material.dart';

class TerritorySheetTopBar extends StatelessWidget {
  const TerritorySheetTopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Center(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.75),
            borderRadius: const BorderRadius.all(Radius.circular(10)),
          ),
          height: 4,
          width: 40,
          margin: const EdgeInsets.symmetric(vertical: 10),
        ),
      ),
    );
  }
}
