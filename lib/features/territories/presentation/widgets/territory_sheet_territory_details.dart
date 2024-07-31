import 'dart:convert';

import 'package:easy_localization/easy_localization.dart';
import 'package:field_companion/features/core/infrastructure/models/app_locations.dart';
import 'package:field_companion/features/core/infrastructure/models/color_palette.dart';
import 'package:field_companion/features/core/presentation/constants/ui_spacing.dart';
import 'package:field_companion/features/territories/domain/models/territory.dart';
import 'package:field_companion/features/territories/presentation/providers/selected_territory_provider.dart';
import 'package:field_companion/features/territories/presentation/providers/territories_provider.dart';
import 'package:field_companion/features/territories/presentation/widgets/territory_sheet_change_population_count.dart';
import 'package:field_companion/features/territories/presentation/widgets/territory_sheet_visit_bans.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:share_plus/share_plus.dart';

class TerritorySheetTerritoryDetails extends ConsumerWidget {
  TerritorySheetTerritoryDetails({super.key, required this.territory});

  final Territory territory;

  final textFieldController = TextEditingController();

  void populationCountDialog(BuildContext context, WidgetRef ref) {
    showModalBottomSheet(
      context: context,
      backgroundColor: ColorPalette.dark,
      barrierColor: ColorPalette.backdrop,
      builder: (context) => TerritorySheetChangePopulationCount(),
    );
  }

  Future<void> returnTerritory(BuildContext context, WidgetRef ref) async {
    final selectedTerritory = ref.read(selectedTerritoryProvider);

    if (selectedTerritory == null) {
      return;
    }

    final fileName = "${selectedTerritory.name} ${selectedTerritory.key}";
    final fileNameWithExt = "$fileName.json";

    final result = await Share.shareXFiles(
      subject: fileName,
      [
        XFile.fromData(
          utf8.encode(selectedTerritory.toJson().toString()),
          mimeType: 'text/plain',
          name: fileNameWithExt,
        ),
      ],
      fileNameOverrides: [fileNameWithExt],
    );

    if (result.status == ShareResultStatus.unavailable) {
      // TODO: Show error message
    }

    if (result.status == ShareResultStatus.success) {
      ref.read(territoriesProvider.notifier).delete(selectedTerritory);

      if (context.mounted) {
        context.go(AppLocations.territories.href);
      }
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(UiSpacing.spacingXs),
      child: Column(
        children: [
          const SizedBox(height: UiSpacing.spacingS),
          informationRow(
            'territories.assignTime'.tr(),
            Text(
              DateFormat('dd.MM.yyyy').format(territory.startTime),
              style: const TextStyle(
                color: Colors.white,
                fontFamily: 'Heebo',
              ),
            ),
          ),
          informationRow(
            'territories.assignEndTime'.tr(),
            Text(
              DateFormat('dd.MM.yyyy').format(
                // TODO: Check if this is correct (November + 3 months = February)
                DateTime(
                  territory.startTime.year,
                  territory.startTime.month + territory.estimationInMonths,
                  territory.startTime.day,
                ),
              ),
              style: const TextStyle(
                color: Colors.white,
                fontFamily: 'Heebo',
              ),
            ),
          ),
          informationRow(
            'territories.populationCount'.tr(),
            InkWell(
              onTap: () => populationCountDialog(context, ref),
              child: Row(
                children: [
                  Text(
                    territory.populationCount.toString(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontFamily: 'Heebo',
                    ),
                  ),
                  const SizedBox(width: UiSpacing.spacingS),
                  const Icon(
                    FeatherIcons.edit3,
                    color: ColorPalette.blue,
                    size: 16,
                  ),
                ],
              ),
            ),
          ),
          Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () => returnTerritory(context, ref),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: UiSpacing.spacingS,
                  vertical: UiSpacing.spacingXs,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'territories.returnTerritory'.tr(),
                      style: const TextStyle(
                        color: ColorPalette.red,
                        fontFamily: 'Heebo',
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                      ),
                    ),
                    const Icon(
                      Icons.logout,
                      color: ColorPalette.red,
                      size: 20,
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: UiSpacing.spacingM),
          TerritorySheetVisitBans(),
        ],
      ),
    );
  }

  Widget informationRow(String key, Widget widget) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: UiSpacing.spacingS,
        vertical: UiSpacing.spacingXs,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            key,
            style: const TextStyle(
              color: Colors.white,
              fontFamily: 'Heebo',
              fontWeight: FontWeight.w700,
              fontSize: 16,
            ),
          ),
          widget,
        ],
      ),
    );
  }
}
