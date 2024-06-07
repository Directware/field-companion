import 'package:easy_localization/easy_localization.dart';
import 'package:field_companion/features/territories/domain/models/territory.dart';
import 'package:flutter/material.dart';

class TerritoryDetailView extends StatelessWidget {
  const TerritoryDetailView({super.key, required this.territory});

  final Territory territory;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(territory.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            getRow(
              'territories.assignTime'.tr(),
              DateFormat('dd/MM/yy').format(territory.startTime),
            ),
            const Divider(),
            getRow(
              'territories.assignEndTime'.tr(),
              DateFormat('dd/MM/yy').format(
                DateTime(
                  territory.startTime.year,
                  territory.startTime.month + territory.estimationInMonths,
                  territory.startTime.day,
                ),
              ),
            ),
            const Divider(),
            getRow(
              'territories.populationCount'.tr(),
              territory.populationCount.toString(),
            ),
          ],
        ),
      ),
    );
  }

  // better name needed i guess
  Row getRow(String key, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          key,
          style: const TextStyle(color: Colors.black),
        ),
        Text(
          value,
          style: const TextStyle(color: Colors.black),
        ),
      ],
    );
  }
}
