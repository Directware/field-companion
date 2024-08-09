import 'package:easy_localization/easy_localization.dart';
import 'package:field_companion/features/core/infrastructure/models/color_palette.dart';
import 'package:field_companion/features/core/presentation/constants/ui_spacing.dart';
import 'package:field_companion/features/territories/domain/models/visit_ban.dart';
import 'package:field_companion/features/territories/presentation/providers/selected_territory_provider.dart';
import 'package:field_companion/features/territories/presentation/providers/territories_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TerritorySheetAddVisitBan extends ConsumerWidget {
  final nameInputController = TextEditingController();
  final streetInputController = TextEditingController();
  final streetSuffixInputController = TextEditingController();
  final cityInputController = TextEditingController();

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

  bool _isValid() {
    return streetInputController.text.isNotEmpty &&
        streetSuffixInputController.text.isNotEmpty &&
        cityInputController.text.isNotEmpty;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(UiSpacing.spacingM),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                tr("territories.newVisitBan"),
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
          TextField(
            controller: nameInputController,
            decoration: decoration(tr("territories.visitBanName")),
          ),
          const SizedBox(height: UiSpacing.spacingS),
          TextField(
            controller: streetInputController,
            decoration: decoration(tr("territories.visitBanStreet")),
          ),
          const SizedBox(height: UiSpacing.spacingS),
          TextField(
            controller: streetSuffixInputController,
            decoration: decoration(tr("territories.visitBanStreetSuffix")),
          ),
          const SizedBox(height: UiSpacing.spacingS),
          TextField(
            controller: cityInputController,
            decoration: decoration(tr("territories.visitBanCity")),
          ),
          const SizedBox(height: UiSpacing.spacingL),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                // TODO: Add notification if fields are empty
                if (_isValid() == false) return;

                final selectedTerritory = ref.read(selectedTerritoryProvider);
                final name = nameInputController.text;
                final street = streetInputController.text;
                final streetSuffix = streetSuffixInputController.text;
                final city = cityInputController.text;
                final vb = VisitBan.create(name, street, streetSuffix, city);

                ref
                    .read(territoriesProvider.notifier)
                    .addVisitBan(selectedTerritory!.id, vb);

                Navigator.pop(context);
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
              child: Text(tr("common.add")),
            ),
          ),
        ],
      ),
    );
  }
}
