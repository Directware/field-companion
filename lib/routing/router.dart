import 'package:field_companion/features/core/presentation/widget/welcome.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

part 'router.g.dart';

final router =
    GoRouter(routes: $appRoutes, initialLocation: WelcomeRoute().location);

@TypedGoRoute<WelcomeRoute>(path: '/welcome')
class WelcomeRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const Welcome();
  }
}
