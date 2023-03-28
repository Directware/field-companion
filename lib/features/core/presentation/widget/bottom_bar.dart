import 'dart:ui';

import 'package:field_companion/features/core/presentation/providers/is_router_link_active_provider.dart';
import 'package:field_companion/routing/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class BottomBar extends ConsumerWidget {
  const BottomBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ColoredBox(
      color: const Color(0xCC14191f),
      child: ClipRRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 52),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () => context.go(AppLocations.territories.href),
                  icon: Icon(
                    color: isLinkActive(ref, AppLocations.territories),
                    size: 20,
                    FeatherIcons.map,
                  ),
                ),
                IconButton(
                  onPressed: () => context.go(AppLocations.fieldService.href),
                  icon: Icon(
                    color: isLinkActive(ref, AppLocations.fieldService),
                    size: 20,
                    FeatherIcons.clock,
                  ),
                ),
                IconButton(
                  onPressed: () => context.go(AppLocations.settings.href),
                  icon: Icon(
                    color: isLinkActive(ref, AppLocations.settings),
                    size: 20,
                    FeatherIcons.settings,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Color isLinkActive(WidgetRef ref, AppLocations appLocations) {
    if (ref.watch(isRouterLinkActiveProvider(appLocations))) {
      return const Color(0xFF3694e2);
    }

    return Colors.white;
  }
}
