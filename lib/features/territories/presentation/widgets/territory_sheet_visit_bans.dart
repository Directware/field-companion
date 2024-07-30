import 'package:easy_localization/easy_localization.dart';
import 'package:field_companion/features/core/infrastructure/models/color_palette.dart';
import 'package:field_companion/features/core/presentation/constants/ui_spacing.dart';
import 'package:field_companion/features/territories/presentation/providers/selected_territory_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TerritorySheetVisitBans extends ConsumerWidget {
  final textFieldController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedTerritory = ref.watch(selectedTerritoryProvider);

    return Padding(
      padding: const EdgeInsets.all(UiSpacing.spacingXs),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white.withOpacity(0.1),
        ),
        child: Padding(
          padding: const EdgeInsets.all(UiSpacing.spacingS),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: UiSpacing.spacingS),
                child: Text(
                  'territories.visitBans'.tr(),
                  style: const TextStyle(
                    fontFamily: 'Heebo',
                    fontWeight: FontWeight.w800,
                    fontSize: 18,
                  ),
                ),
              ),
              if (selectedTerritory!.visitBans.isEmpty)
                Text(
                  'territories.noVisitBans'.tr(),
                  style: const TextStyle(
                    color: Colors.grey,
                  ),
                )
              else
                const Text("Show list with visit bans"),
              const Padding(
                padding: EdgeInsets.only(top: UiSpacing.spacingXs),
                child: Divider(
                  thickness: 0.5,
                ),
              ),
              TextField(
                style: const TextStyle(color: Colors.white),
                controller: textFieldController,
                decoration: InputDecoration(
                  hintText: 'territories.visitBanAddress'.tr(),
                  hintStyle: const TextStyle(color: Colors.grey),
                  border: const OutlineInputBorder(),
                ),
              ),
              Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {
                    // up
                    textFieldController.clear();
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: UiSpacing.spacingS,
                      bottom: UiSpacing.spacingXs,
                    ),
                    child: Row(
                      children: [
                        Text(
                          'territories.addVisitBans'.tr(),
                          style: const TextStyle(
                            color: ColorPalette.blue,
                            fontFamily: 'Heebo',
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
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
