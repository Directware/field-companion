import 'package:field_companion/features/app_settings/presentation/widgets/settings.dart';
import 'package:field_companion/features/core/presentation/widget/home.dart';
import 'package:field_companion/features/core/presentation/widget/welcome.dart';
import 'package:field_companion/features/field_service/presentation/widget/field_service.dart';
import 'package:field_companion/features/territory_cards/presentation/widget/territories.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

enum AppLocations {
  welcome,
  main,
  territories,
  fieldService,
  settings,
}

extension AppLocationsExtension on AppLocations {
  String get href {
    switch (this) {
      case AppLocations.main:
        return '/';
      case AppLocations.welcome:
        return '/welcome';
      case AppLocations.fieldService:
        return '/field-service';
      case AppLocations.territories:
        return '/territories';
      case AppLocations.settings:
        return '/settings';
      default:
        return "/";
    }
  }
}

final _key = GlobalKey<NavigatorState>(debugLabel: 'navigatorKey');

final appRoutes = [
  GoRoute(
      path: AppLocations.welcome.href,
      builder: (context, state) => const Welcome()),
  ShellRoute(
      navigatorKey: _key,
      builder: (context, state, child) => Home(child: child),
      routes: [
        GoRoute(
            path: AppLocations.main.href,
            redirect: (context, state) => AppLocations.fieldService.href),
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
      ])
];
