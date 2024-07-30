import 'package:easy_localization/easy_localization.dart';
import 'package:field_companion/features/core/infrastructure/models/color_palette.dart';
import 'package:field_companion/features/core/presentation/constants/ui_spacing.dart';
import 'package:field_companion/features/territories/domain/models/territory.dart';
import 'package:field_companion/features/territories/presentation/providers/selected_territory_provider.dart';
import 'package:field_companion/features/territories/presentation/providers/territories_provider.dart';
import 'package:field_companion/features/territories/presentation/widgets/territory_sheet_visit_bans.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TerritorySheetTerritoryDetails extends ConsumerWidget {
  TerritorySheetTerritoryDetails({super.key, required this.territory});

  final Territory territory;

  final textFieldController = TextEditingController();

  void populationCountDialog(BuildContext context, WidgetRef ref) {
    final selectedTerritory = ref.watch(selectedTerritoryProvider);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        String enteredNumber = '';
        return AlertDialog(
          title: Text(
            'territories.provideNewPopulationCount'.tr(),
            style: const TextStyle(color: Colors.black),
          ),
          content: TextField(
            keyboardType: TextInputType.number,
            onChanged: (value) {
              enteredNumber = value;
            },
            style: const TextStyle(color: Colors.black),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                'common.cancel'.tr(),
                style: const TextStyle(color: Colors.black),
              ),
            ),
            TextButton(
              onPressed: () {
                // Validate and process the entered number
                if (int.tryParse(enteredNumber) != null) {
                  final number = int.parse(enteredNumber);

                  ref
                      .read(territoriesProvider.notifier)
                      .updatePopulationCount(selectedTerritory!.id, number);
                } else {
                  // Show an error message
                  // TODO: print('Invalid number');
                }
                Navigator.of(context).pop();
              },
              child: Text(
                'common.save'.tr(),
                style: const TextStyle(color: Colors.black),
              ),
            ),
          ],
        );
      },
    );
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
              onTap: () {
                // setState(() {
                //   widget.toggleReturnTerritoryView(true);
                // });
              },
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
