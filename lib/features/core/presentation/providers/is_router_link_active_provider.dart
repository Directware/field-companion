import 'package:field_companion/models/app_locations.dart';
import 'package:field_companion/routing/providers/active_route_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'is_router_link_active_provider.g.dart';

@riverpod
bool isRouterLinkActive(IsRouterLinkActiveRef ref, AppLocations appLocation) {
  final activeRouteNotifier = ref.watch(activeRouteProvider);
  return activeRouteNotifier.value.location == appLocation.href;
}
