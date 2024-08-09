import 'package:easy_localization/easy_localization.dart';
import 'package:field_companion/features/core/infrastructure/models/app_locations.dart';
import 'package:field_companion/features/territories/domain/models/territory.dart';
import 'package:field_companion/features/territories/presentation/providers/selected_territory_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class TerritorySheetTitleBar extends ConsumerWidget {
  const TerritorySheetTitleBar(
    this.selectedTerritory, {
    super.key,
    required this.sheetController,
  });

  final Territory? selectedTerritory;

  final DraggableScrollableController sheetController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SliverAppBar(
      title: AnimatedSwitcher(
        duration: const Duration(milliseconds: 500),
        transitionBuilder: (Widget child, Animation<double> animation) {
          return FadeTransition(
            opacity: animation,
            child: child,
          );
        },
        child: Text(
          selectedTerritory != null
              ? "${selectedTerritory!.name} ${selectedTerritory!.key}"
              : 'territories.title'.tr(),
          style: const TextStyle(color: Colors.white),
        ),
      ),
      backgroundColor: Colors.transparent,
      primary: false,
      pinned: true,
      centerTitle: true,
      leading: InkWell(
        onTap: () {
          if (selectedTerritory != null) {
            ref.read(selectedTerritoryProvider.notifier).reset();
            sheetController.animateTo(
              0.85,
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOut,
            );
          } else {
            context.go(AppLocations.territories.href);
          }
        },
        child: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Icon(
            color: Colors.white,
            size: 32,
            FeatherIcons.chevronLeft,
          ),
        ),
      ),
    );
  }
}
