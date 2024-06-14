import 'package:field_companion/features/core/infrastructure/models/app_locations.dart';
import 'package:field_companion/features/core/infrastructure/models/color_palette.dart';
import 'package:field_companion/features/territories/domain/models/territory.dart';
import 'package:field_companion/features/territories/presentation/providers/territories_provider.dart';
import 'package:field_companion/features/territories/presentation/views/territories_sheet.dart';
import 'package:field_companion/features/territories/presentation/widgets/map_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class TerritoryMap extends ConsumerStatefulWidget {
  const TerritoryMap({super.key});

  @override
  _TerritoryMapState createState() => _TerritoryMapState();
}

class _TerritoryMapState extends ConsumerState<TerritoryMap> {
  List<Territory> territories = [];
  final sheetController = DraggableScrollableController();

  @override
  void initState() {
    super.initState();
    getTerritories();
  }

  void getTerritories() {
    setState(() {
      final territories = ref.read(territoriesProvider);
      this.territories = territories;
    });
  }

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
            ),
            TerritoriesSheet(),
          ],
        ),
      ),
    );
  }
}
