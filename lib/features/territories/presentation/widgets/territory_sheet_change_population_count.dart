import 'package:easy_localization/easy_localization.dart';
import 'package:field_companion/features/core/infrastructure/models/color_palette.dart';
import 'package:field_companion/features/core/presentation/constants/ui_spacing.dart';
import 'package:field_companion/features/territories/presentation/providers/selected_territory_provider.dart';
import 'package:field_companion/features/territories/presentation/providers/territories_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TerritorySheetChangePopulationCount extends ConsumerWidget {
  final inputController = TextEditingController();

  InputDecoration decoration(String hintText) {
    return InputDecoration(
      filled: true,
      border: InputBorder.none,
      fillColor: Colors.white.withOpacity(0.05),
      hintText: hintText,
      hintStyle: TextStyle(
        color: Colors.white.withOpacity(0.5),
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(UiSpacing.spacingM),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                tr("territories.populationCount"),
                style: const TextStyle(fontSize: 24),
              ),
              ElevatedButton(
                onPressed: () => Navigator.of(context).pop(),
                style: ButtonStyle(
                  padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
                    const EdgeInsets.symmetric(horizontal: UiSpacing.spacingS),
                  ),
                  backgroundColor: WidgetStateProperty.all<Color>(
                    ColorPalette.grey2Opacity30,
                  ),
                  foregroundColor: WidgetStateProperty.all<Color>(
                    Colors.white,
                  ),
                ),
                child: Text(
                  tr("common.cancel"),
                ),
              ),
            ],
          ),
          const SizedBox(height: UiSpacing.spacingM),
          Text(
            "${tr("territories.provideNewPopulationCount")}:",
            style: const TextStyle(fontSize: 16),
          ),
          const SizedBox(height: UiSpacing.spacingM),
          TextField(
            // keyboardType: TextInputType.number,
            controller: inputController,
            decoration: decoration(""),
          ),
          const SizedBox(height: UiSpacing.spacingL),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                // TODO: Add notification if fields are empty
                if (inputController.text.isEmpty) return;

                if (int.tryParse(inputController.text) != null) {
                  final newPopulationCount = int.parse(inputController.text);

                  final selectedTerritory = ref.read(selectedTerritoryProvider);
                  ref.read(territoriesProvider.notifier).updatePopulationCount(
                        selectedTerritory!.id,
                        newPopulationCount,
                      );

                  Navigator.pop(context);
                }

                // TODO: Add error message
              },
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all<Color>(
                  ColorPalette.blue,
                ),
                foregroundColor: WidgetStateProperty.all<Color>(
                  Colors.white,
                ),
                shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
              child: Text(tr("common.save")),
            ),
          ),
        ],
      ),
    );
  }
}
