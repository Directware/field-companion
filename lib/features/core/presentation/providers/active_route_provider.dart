import 'package:field_companion/features/core/presentation/providers/router_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// ignore: implementation_imports
import 'package:go_router/src/information_provider.dart';

final activeRouteProvider =
    ChangeNotifierProvider<GoRouteInformationProvider>((Ref ref) {
  final router = ref.watch(routerProvider);
  return router.routeInformationProvider;
});
