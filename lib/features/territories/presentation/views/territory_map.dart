import 'package:field_companion/features/core/infrastructure/models/app_locations.dart';
import 'package:field_companion/features/core/infrastructure/models/color_palette.dart';
import 'package:field_companion/features/territories/presentation/widgets/map_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:go_router/go_router.dart';

class TerritoryMap extends StatelessWidget {
  const TerritoryMap({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (_) {
        context.go(AppLocations.territories.href);
      },
      child: Scaffold(
        body: Stack(
          children: [
            // floating button
            const MapWidget(),
            Positioned(
              top: 15,
              left: 15,
              child: SafeArea(
                child: InkWell(
                  onTap: () {
                    context.go(AppLocations.territories.href);
                  },
                  child: Material(
                    borderRadius: BorderRadius.circular(5),
                    color: ColorPalette.dark,
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(
                        color: Colors.white,
                        size: 32,
                        FeatherIcons.arrowLeft,
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
