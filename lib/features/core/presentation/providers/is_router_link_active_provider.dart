import 'package:field_companion/features/core/infrastructure/models/app_locations.dart';
import 'package:field_companion/features/core/presentation/providers/active_route_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'is_router_link_active_provider.g.dart';

@riverpod
bool isRouterLinkActive(IsRouterLinkActiveRef ref, AppLocations appLocation) {
  final activeRouteNotifier = ref.watch(activeRouteProvider);
  // ignore: deprecated_member_use
  return activeRouteNotifier.value.location == appLocation.href;
}
