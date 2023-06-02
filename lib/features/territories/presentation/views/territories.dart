import 'package:easy_localization/easy_localization.dart';
import 'package:field_companion/features/core/infrastructure/models/app_locations.dart';
import 'package:field_companion/features/core/infrastructure/models/color_palette.dart';
import 'package:field_companion/features/core/presentation/widgets/title_bar.dart';
import 'package:field_companion/features/territories/domain/models/territory.dart';
import 'package:field_companion/features/territories/presentation/providers/selected_territory_provider.dart';
import 'package:field_companion/features/territories/presentation/providers/territories_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class Territories extends ConsumerWidget {
  const Territories({super.key});

  void onSelected(BuildContext context, WidgetRef ref, Territory territory) {
    ref.read(selectedTerritoryProvider.notifier).set(territory);
    context.go(AppLocations.map.href);
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
              color: ColorPalette.grey2Opacity24,
              shape: const CircleBorder(),
              child: InkWell(
                onTap: () => ref.read(territoriesProvider.notifier).add(),
                borderRadius: const BorderRadius.all(Radius.circular(16)),
                child: const Padding(
                  padding: EdgeInsets.all(4),
                  child: Icon(
                    FeatherIcons.plus,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: territories.length,
              itemBuilder: (context, index) => ListTile(
                onTap: () => context.go(AppLocations.map.href),
                title: Text(
                  '${territories[index].key} ${territories[index].name}',
                ),
                subtitle: Text(territories[index].id),
                trailing: IconButton(
                  onPressed: () => onSelected(context, ref, territories[index]),
                  icon: const Icon(FeatherIcons.trash2),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
