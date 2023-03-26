import 'package:field_companion/routing/app_router.dart';
import 'package:field_companion/routing/providers/router_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'router_provider.g.dart';

final _key = GlobalKey<NavigatorState>(debugLabel: 'routerKey');

@Riverpod(keepAlive: true)
GoRouter router(Ref ref) {
  final notifier = ref.watch(routerNotifierProvider.notifier);

  return GoRouter(
      navigatorKey: _key,
      refreshListenable: notifier,
      routes: appRoutes,
      initialLocation: AppLocations.welcome.href);
}
