import 'package:easy_localization/easy_localization.dart';
import 'package:field_companion/features/core/infrastructure/models/color_palette.dart';
import 'package:field_companion/features/core/presentation/constants/ui_spacing.dart';
import 'package:field_companion/features/territories/domain/models/territory.dart';
import 'package:field_companion/features/territories/presentation/providers/selected_territory_provider.dart';
import 'package:field_companion/features/territories/presentation/providers/territories_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TerritoryDetailView extends ConsumerStatefulWidget {
  const TerritoryDetailView({super.key, required this.territory});

  final Territory territory;

  @override
  ConsumerState<TerritoryDetailView> createState() => _TerritoryDetailViewState();
}

class _TerritoryDetailViewState extends ConsumerState<TerritoryDetailView> {
  int populationCount = 0;

  @override
  void initState() {
    populationCount = widget.territory.populationCount;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(UiSpacing.spacingXs),
      child: Column(
        children: [
          getRow(
            'territories.assignTime'.tr(),
            DateFormat('dd/MM/yy').format(widget.territory.startTime),
          ),
          const Divider(
            height: 1,
            thickness: 0.5,
          ),
          getRow(
            'territories.assignEndTime'.tr(),
            DateFormat('dd/MM/yy').format(
              DateTime(
                widget.territory.startTime.year,
                widget.territory.startTime.month + widget.territory.estimationInMonths,
                widget.territory.startTime.day,
              ),
            ),
          ),
          const Divider(
            height: 1,
            thickness: 0.5,
          ),
          Padding(
            padding: const EdgeInsets.all(UiSpacing.spacingS),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'territories.populationCount'.tr(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontFamily: 'Heebo',
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                  ),
                ),
                InkWell(
                  onTap: () {
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

                                  ref.read(territoriesProvider.notifier).updatePopulationCount(widget.territory.id, number);
                                  setState(() {
                                    populationCount = number;
                                  });
                                } else {
                                  // Show an error message
                                  print('Invalid number');
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
                  },
                  child: Row(
                    children: [
                      Text(
                        populationCount.toString(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontFamily: 'Heebo',
                        ),
                      ),
                      const SizedBox(width: UiSpacing.spacingXs),
                      const Icon(
                        FeatherIcons.edit,
                        color: ColorPalette.blue,
                        size: 18,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const Divider(
            height: 1,
            thickness: 0.5,
          ),
          Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () {
                print("Return territory");
              },
              child: Padding(
                padding: const EdgeInsets.all(UiSpacing.spacingS),
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
        ],
      ),
    );
  }

  // better name needed i guess
  Widget getRow(String key, String value) {
    return Padding(
      padding: const EdgeInsets.all(UiSpacing.spacingS),
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
          Text(
            value,
            style: const TextStyle(
              color: Colors.white,
              fontFamily: 'Heebo',
            ),
          ),
        ],
      ),
    );
  }
}
