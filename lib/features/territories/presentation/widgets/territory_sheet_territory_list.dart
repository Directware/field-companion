import 'package:field_companion/features/core/infrastructure/models/color_palette.dart';
import 'package:field_companion/features/territories/presentation/providers/selected_territory_provider.dart';
import 'package:field_companion/features/territories/presentation/providers/territories_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TerritorySheetTerritoryList extends ConsumerWidget {
  const TerritorySheetTerritoryList({
    super.key,
    required this.sheetController,
  });

  final DraggableScrollableController sheetController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final territories = ref.watch(territoriesProvider);

    return SizedBox(
      key: const ValueKey<int>(1),
      height: MediaQuery.of(context).size.height,
      child: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                final territory = territories[index];
                return InkWell(
                  child: ListTile(
                    title: Text(
                      territory.name,
                      style: const TextStyle(color: Colors.white),
                    ),
                    subtitle: Text(
                      territory.key,
                      style: const TextStyle(color: Colors.white),
                    ),
                    trailing: const Icon(
                      color: ColorPalette.blue,
                      size: 20,
                      FeatherIcons.arrowRight,
                    ),
                  ),
                  onTap: () {
                    ref.read(selectedTerritoryProvider.notifier).set(territory);
                    sheetController.animateTo(
                      0.12,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeInOut,
                    );
                  },
                );
              },
              childCount: territories.length,
            ),
          ),
        ],
      ),
    );
  }
}
