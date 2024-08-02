import 'package:easy_localization/easy_localization.dart';
import 'package:field_companion/features/core/infrastructure/models/color_palette.dart';
import 'package:field_companion/features/core/presentation/constants/ui_spacing.dart';
import 'package:field_companion/features/territories/domain/models/territory.dart';
import 'package:field_companion/features/territories/presentation/providers/selected_territory_provider.dart';
import 'package:field_companion/features/territories/presentation/widgets/territory_sheet_add_visit_ban.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TerritorySheetVisitBans extends ConsumerWidget {
  Widget listVisitBans(Territory selectedTerritory) {
    return Column(
      children: [
        for (final visitBan in selectedTerritory.visitBans)
          Padding(
            padding: const EdgeInsets.only(bottom: UiSpacing.spacingM),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${visitBan.street} ${visitBan.streetSuffix}, ${visitBan.city}',
                ),
                Text(
                  visitBan.name.isNotEmpty ? visitBan.name : '-',
                  style: TextStyle(color: Colors.white.withOpacity(0.7)),
                ),
              ],
            ),
          ),
      ],
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedTerritory = ref.watch(selectedTerritoryProvider);

    if (selectedTerritory == null) return const SizedBox();

    return Padding(
      padding: const EdgeInsets.all(UiSpacing.spacingXs),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white.withOpacity(0.19),
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
              const SizedBox(height: UiSpacing.spacingXs),
              if (selectedTerritory.visitBans.isEmpty)
                Padding(
                  padding: const EdgeInsets.only(bottom: UiSpacing.spacingS),
                  child: Text(
                    'territories.noVisitBans'.tr(),
                    style: const TextStyle(
                      color: Colors.grey,
                      decoration: TextDecoration.none,
                    ),
                  ),
                )
              else
                listVisitBans(selectedTerritory),
              InkWell(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    backgroundColor: ColorPalette.dark,
                    barrierColor: ColorPalette.backdrop,
                    builder: (context) => Padding(
                      padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom,
                      ),
                      child: TerritorySheetAddVisitBan(),
                    ),
                  );
                },
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: UiSpacing.spacingXs),
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
            ],
          ),
        ),
      ),
    );
  }
}
