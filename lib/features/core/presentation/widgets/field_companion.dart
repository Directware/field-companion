import 'package:easy_localization/easy_localization.dart';
import 'package:field_companion/features/core/presentation/providers/router_provider.dart';
import 'package:field_companion/features/core/presentation/providers/shared_media_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FieldCompanion extends ConsumerWidget {
  const FieldCompanion({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.read(incomingSharedMediaProvider);

    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: "Heebo",
        textTheme: Theme.of(context).textTheme.apply(bodyColor: Colors.white),
      ),
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      routerConfig: ref.watch(routerProvider),
    );
  }
}
