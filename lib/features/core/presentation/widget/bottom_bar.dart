import 'dart:ui';

import 'package:field_companion/color_palette.dart';
import 'package:field_companion/features/core/presentation/providers/is_router_link_active_provider.dart';
import 'package:field_companion/features/field_service/presentation/providers/selected_date_provider.dart';
import 'package:field_companion/models/app_locations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class BottomBar extends ConsumerWidget {
  const BottomBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
        child: ColoredBox(
          color: ColorPalette.dark80,
          child: SafeArea(
            minimum: const EdgeInsets.only(bottom: 12),
            child: Padding(
              padding: const EdgeInsets.only(left: 52, right: 52, top: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () =>
                        _navigateTo(context, ref, AppLocations.territories),
                    icon: Icon(
                      color: _isLinkActive(ref, AppLocations.territories),
                      size: 20,
                      FeatherIcons.map,
                    ),
                  ),
                  IconButton(
                    onPressed: () =>
                        _navigateTo(context, ref, AppLocations.fieldService),
                    icon: Icon(
                      color: _isLinkActive(ref, AppLocations.fieldService),
                      size: 20,
                      FeatherIcons.clock,
                    ),
                  ),
                  IconButton(
                    onPressed: () =>
                        _navigateTo(context, ref, AppLocations.settings),
                    icon: Icon(
                      color: _isLinkActive(ref, AppLocations.settings),
                      size: 20,
                      FeatherIcons.settings,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _navigateTo(
      BuildContext context, WidgetRef ref, AppLocations appLocations) {
    ref.read(selectedDateProvider.notifier).clear();
    context.go(appLocations.href);
  }

  Color _isLinkActive(WidgetRef ref, AppLocations appLocations) {
    if (ref.watch(isRouterLinkActiveProvider(appLocations))) {
      return const Color(0xFF3694e2);
    }

    return Colors.white;
  }
}
