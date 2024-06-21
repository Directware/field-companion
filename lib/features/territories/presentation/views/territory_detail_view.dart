import 'package:easy_localization/easy_localization.dart';
import 'package:field_companion/features/core/infrastructure/models/color_palette.dart';
import 'package:field_companion/features/core/presentation/constants/ui_spacing.dart';
import 'package:field_companion/features/territories/domain/models/territory.dart';
import 'package:field_companion/features/territories/presentation/providers/territories_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TerritoryDetailView extends ConsumerStatefulWidget {
  const TerritoryDetailView({super.key, required this.territory});

  final Territory territory;

  @override
  ConsumerState<TerritoryDetailView> createState() =>
      _TerritoryDetailViewState();
}

class _TerritoryDetailViewState extends ConsumerState<TerritoryDetailView> {
  int populationCount = 0;
  bool showSubmitTerritoryView = false;

  final textFieldController = TextEditingController();
  @override
  void initState() {
    populationCount = widget.territory.populationCount;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(UiSpacing.spacingXs),
      child: Stack(
        children: [
          Visibility(
            visible: !showSubmitTerritoryView,
            child: territoryDetail(context),
          ),
          Visibility(
            visible: showSubmitTerritoryView,
            child: getSubmitTerritoryView(context),
          ),
        ],
      ),
    );
  }

  Column territoryDetail(BuildContext context) {
    return Column(
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
              widget.territory.startTime.month +
                  widget.territory.estimationInMonths,
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

                                ref
                                    .read(territoriesProvider.notifier)
                                    .updatePopulationCount(
                                      widget.territory.id,
                                      number,
                                    );
                                setState(() {
                                  populationCount = number;
                                });
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
              setState(() {
                showSubmitTerritoryView = true;
              });
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
        Padding(
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
                  if (widget.territory.visitBans.isEmpty)
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
                        // update territory with new visit ban
                        // ref.read(territoriesProvider.notifier).addVisitBan(
                        //       widget.territory.id,
                        //       VisitBan(),
                        //     );
                        textFieldController.clear();
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: UiSpacing.spacingS,
                            bottom: UiSpacing.spacingXs),
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
        ),
      ],
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

  Widget getSubmitTerritoryView(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: UiSpacing.spacingS),
        getInstructionRow(1,
            'Make sure this is really the right territory and you have completed it.'),
        getInstructionRow(2,
            'Send your territory servant the territory with the send button with the first button below.'),
        getInstructionRow(
          3,
          'After you successfully send the territory back to your territory servant, delete it from your app, by marking it as done with the button below.',
        ),
        const SizedBox(height: UiSpacing.spacingM),
        Padding(
          padding: const EdgeInsets.all(UiSpacing.spacingS),
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              backgroundColor: Colors.blue,
            ),
            child: Container(
              alignment: Alignment.center,
              child: Text(
                'territories.sendToServant'.tr(),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: () {
                setState(() {
                  showSubmitTerritoryView = false;
                });
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                backgroundColor: Colors.transparent,
                side: const BorderSide(
                  color: Colors.grey,
                ),
              ),
              child: Text(
                'common.cancel'.tr(),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // Button action
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                backgroundColor: Colors.transparent,
                side: const BorderSide(
                  color: ColorPalette.red,
                ),
              ),
              child: const Text(
                'Mark Territory as Done',
                style: TextStyle(
                  color: ColorPalette.red,
                  fontSize: 18,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget getInstructionRow(int index, String instruction) {
    return Padding(
      padding: const EdgeInsets.all(UiSpacing.spacingS),
      child: Row(
        children: [
          Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: ColorPalette.blue,
                width: 2,
              ),
            ),
            child: Center(
              child: Text(
                index.toString(),
                style: const TextStyle(
                  color: Colors.blue,
                  fontFamily: 'Heebo',
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                ),
              ),
            ),
          ),
          const SizedBox(width: UiSpacing.spacingS),
          Expanded(
            child: Text(
              instruction,
              style: const TextStyle(
                color: Colors.white,
                fontFamily: 'Heebo',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
