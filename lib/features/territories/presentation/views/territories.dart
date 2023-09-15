import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:field_companion/features/core/infrastructure/models/app_locations.dart';
import 'package:field_companion/features/core/infrastructure/models/color_palette.dart';
import 'package:field_companion/features/core/presentation/widgets/title_bar.dart';
import 'package:field_companion/features/territories/domain/models/territory.dart';
import 'package:field_companion/features/territories/presentation/providers/selected_territory_provider.dart';
import 'package:field_companion/features/territories/presentation/providers/territories_provider.dart';
import 'package:field_companion/features/territories/presentation/widgets/no_territories_placeholder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:jiffy/jiffy.dart';

class Territories extends ConsumerWidget {
  const Territories({super.key});

  void onSelected(BuildContext context, WidgetRef ref, Territory territory) {
    log("Selected territory: ${territory.key} ${territory.name}");
    ref.read(selectedTerritoryProvider.notifier).set(territory);
    context.go(AppLocations.map.href);
  }

  Text _timeInformationWidget(Territory territory) {
    final startTime = Jiffy(
      DateTime(
        territory.startTime.year,
        territory.startTime.month,
        territory.startTime.day,
      ),
    );

    final estimatedIn = territory.estimationInMonths;
    final endDateTime = Jiffy(startTime).add(months: estimatedIn).dateTime;
    final now = DateTime.now();

    final int leftMonths = Jiffy(endDateTime).diff(now, Units.MONTH).toInt();
    final int leftDays = Jiffy(endDateTime)
        .subtract(months: leftMonths)
        .diff(now, Units.DAY)
        .toInt();

    if (leftMonths <= 0 && leftDays <= 0) {
      final int expiredMonths =
          Jiffy(now).diff(endDateTime, Units.MONTH).toInt();

      final int expiredDays = Jiffy(now)
          .subtract(months: expiredMonths)
          .diff(endDateTime, Units.DAY)
          .toInt();

      return Text(
        textAlign: TextAlign.right,
        style: const TextStyle(
          fontFamily: "Heebo",
          fontSize: 16,
          color: ColorPalette.red,
          letterSpacing: 0.4,
          height: 1.5,
        ),
        "${"territories.toLate".tr()} ${expiredMonths}M ${expiredDays}T",
      );
    }

    return Text(
      textAlign: TextAlign.right,
      style: const TextStyle(
        fontFamily: "Heebo",
        fontSize: 16,
        color: ColorPalette.grey2,
        letterSpacing: 0.4,
        height: 1.5,
      ),
      "${"territories.still".tr()} ${leftMonths}M ${leftDays}T",
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final territories = ref.watch(territoriesProvider);
    return Material(
      color: Colors.transparent,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TitleBar(
            title: 'territories.title'.tr(),
            trailing: Material(
              color: Colors.transparent,
              child: InkWell(
                  onTap: () => ref.read(territoriesProvider.notifier).add(),
                  borderRadius: const BorderRadius.all(Radius.circular(16)),
                  child: const Icon(
                    size: 30,
                    FeatherIcons.plus,
                    color: ColorPalette.blue,
                  ),),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
            ),
            child: territories.isNotEmpty
                ? ListView.builder(
                    itemCount: territories.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) => ListTile(
                      onTap: () => onSelected(context, ref, territories[index]),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 4,
                      ),
                      minVerticalPadding: 0,
                      minLeadingWidth: 0,
                      horizontalTitleGap: 0,
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            style: const TextStyle(
                              fontFamily: "Heebo",
                              fontSize: 16,
                              letterSpacing: 0.4,
                              height: 1.5,
                            ),
                            '${territories[index].name} ${territories[index].key}',
                          ),
                          _timeInformationWidget(territories[index]),
                        ],
                      ),
                    ),
                  )
                : const NoTerritoriesPlaceholder(),
          ),
        ],
      ),
    );
  }
}
