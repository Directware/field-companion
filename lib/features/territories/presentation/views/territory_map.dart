import 'package:field_companion/features/core/infrastructure/models/app_locations.dart';
import 'package:field_companion/features/territories/presentation/views/territories_sheet.dart';
import 'package:field_companion/features/territories/presentation/widgets/map_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class TerritoryMap extends StatelessWidget {
  const TerritoryMap({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (_) => context.go(AppLocations.territories.href),
      child: Scaffold(
        body: Stack(
          children: [
            const MapWidget(),
            IgnorePointer(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.white,
                      Colors.white.withOpacity(0.10),
                      Colors.white.withOpacity(0.00),
                    ],
                    stops: const [0.0, 0.10, 1.0],
                  ),
                ),
              ),
            ),
            TerritoriesSheet(),
          ],
        ),
      ),
    );
  }
}
