import 'package:field_companion/features/core/presentation/widgets/blurred_background_image.dart';
import 'package:field_companion/features/territories/presentation/providers/selected_territory_provider.dart';
import 'package:field_companion/features/territories/presentation/widgets/territory_sheet_territory_details.dart';
import 'package:field_companion/features/territories/presentation/widgets/territory_sheet_territory_list.dart';
import 'package:field_companion/features/territories/presentation/widgets/territory_sheet_title_bar.dart';
import 'package:field_companion/features/territories/presentation/widgets/territory_sheet_top_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TerritoriesSheet extends ConsumerWidget {
  final sheetController = DraggableScrollableController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedTerritory = ref.watch(selectedTerritoryProvider);

    return DraggableScrollableSheet(
      initialChildSize: 0.12,
      minChildSize: 0.1,
      maxChildSize: 0.85,
      snap: true,
      snapSizes: const [0.1, 0.2, 0.5, 0.85],
      controller: sheetController,
      builder: (BuildContext context, scrollController) {
        return Container(
          clipBehavior: Clip.hardEdge,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25),
              topRight: Radius.circular(25),
            ),
          ),
          child: Stack(
            children: [
              BlurredBackgroundImage(),
              CustomScrollView(
                controller: scrollController,
                slivers: [
                  const TerritorySheetTopBar(),
                  TerritorySheetTitleBar(
                    selectedTerritory,
                    sheetController: sheetController,
                  ),
                  SliverToBoxAdapter(
                    child: selectedTerritory != null
                        ? TerritorySheetTerritoryDetails(
                            territory: selectedTerritory,
                          )
                        : TerritorySheetTerritoryList(
                            sheetController: sheetController,
                          ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
