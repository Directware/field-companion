import 'package:field_companion/features/core/infrastructure/models/app_locations.dart';
import 'package:field_companion/features/core/presentation/views/home.dart';
import 'package:field_companion/features/core/presentation/views/welcome.dart';
import 'package:field_companion/features/field_service/presentation/views/field_service.dart';
import 'package:field_companion/features/settings/presentation/providers/app_initialisation_provider.dart';
import 'package:field_companion/features/settings/presentation/widgets/settings.dart';
import 'package:field_companion/features/territories/presentation/views/territories.dart';
import 'package:field_companion/features/territories/presentation/views/territory_map.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'router_notifier.g.dart';

final _key = GlobalKey<NavigatorState>(debugLabel: 'navigatorKey');

@Riverpod(keepAlive: true)
class RouterNotifier extends _$RouterNotifier implements Listenable {
  VoidCallback? routerListener;
  bool isInitialised = false;

  List<RouteBase> get routes => [
        GoRoute(
          path: AppLocations.welcome.href,
          builder: (context, state) => const Welcome(),
        ),
        GoRoute(
          path: AppLocations.map.href,
          builder: (context, state) => const TerritoryMap(),
        ),
        ShellRoute(
          navigatorKey: _key,
          builder: (context, state, child) => Home(child: child),
          routes: [
            GoRoute(
              path: AppLocations.main.href,
              redirect: (context, state) => AppLocations.fieldService.href,
            ),
            GoRoute(
              path: AppLocations.territories.href,
              pageBuilder: (context, state) => CustomTransitionPage<void>(
                key: state.pageKey,
                transitionDuration: const Duration(milliseconds: 150),
                child: const Territories(),
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) =>
                        FadeTransition(
                  opacity: CurveTween(curve: Curves.linear).animate(animation),
                  child: child,
                ),
              ),
            ),
            GoRoute(
              path: AppLocations.fieldService.href,
              pageBuilder: (context, state) => CustomTransitionPage<void>(
                key: state.pageKey,
                transitionDuration: const Duration(milliseconds: 150),
                child: const FieldService(),
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) =>
                        FadeTransition(
                  opacity: CurveTween(curve: Curves.linear).animate(animation),
                  child: child,
                ),
              ),
            ),
            GoRoute(
              path: AppLocations.settings.href,
              pageBuilder: (context, state) => CustomTransitionPage<void>(
                key: state.pageKey,
                transitionDuration: const Duration(milliseconds: 150),
                child: const Settings(),
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) =>
                        FadeTransition(
                  opacity: CurveTween(curve: Curves.linear).animate(animation),
                  child: child,
                ),
              ),
            ),
          ],
        ),
      ];

  String get initialLocation => AppLocations.fieldService.href;

  String? redirect(BuildContext context, GoRouterState state) {
    if (this.state.isLoading || this.state.hasError) return null;

    if (state.fullPath == AppLocations.welcome.href) {
      if (isInitialised) return AppLocations.fieldService.href;
    } else {
      if (!isInitialised) return AppLocations.welcome.href;
    }

    return null;
  }

  @override
  Future<void> build() async {
    isInitialised = ref.watch(appInitialisationProvider);

    ref.listenSelf((_, __) {
      if (state.isLoading) return;
      routerListener?.call();
    });
  }

  @override
  void addListener(VoidCallback listener) {
    routerListener = listener;
  }

  @override
  void removeListener(VoidCallback listener) {
    routerListener = null;
  }
}
