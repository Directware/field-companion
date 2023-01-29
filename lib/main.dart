import 'dart:developer';

import 'package:field_companion/features/core/presentation/widget/field_companion.dart';
import 'package:field_companion/features/field_service/domain/report_entry.dart';
import 'package:field_companion/features/territory_cards/domain/drawing.dart';
import 'package:field_companion/features/territory_cards/domain/publisher.dart';
import 'package:field_companion/features/territory_cards/domain/territory.dart';
import 'package:field_companion/providers/shared_preferences_provider.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  // await _initDatabase();

  final Widget easyLocalization = EasyLocalization(
      supportedLocales: const [
        Locale('en', 'US'),
        Locale('de', 'DE'),
        Locale('pl', 'PL')
      ],
      path: 'assets/i18n',
      saveLocale: false,
      useFallbackTranslations: true,
      useOnlyLangCode: true,
      fallbackLocale: const Locale('en', 'US'),
      child: const FieldCompanion());

  // For widgets to be able to read providers, we need to wrap the entire
  // application in a "ProviderScope" widget.
  // This is where the state of our providers will be stored.
  final sharedPreferences = await SharedPreferences.getInstance();

  runApp(ProviderScope(
    overrides: [
      sharedPreferencesProvider.overrideWith((ref) => sharedPreferences)
    ],
    observers: [],
    child: easyLocalization,
  ));
}

/// Um die Adapter zu generieren muss folgender Befehl ausgeführt werden: flutter packages pub run build_runner build
Future<void> _initDatabase() async {
  log("Start initialise database.");

  await Hive.initFlutter();

  Hive.registerAdapter(ReportEntryAdapter());
  Hive.registerAdapter(PublisherAdapter());
  Hive.registerAdapter(DrawingAdapter());
  Hive.registerAdapter(TerritoryAdapter());

  log("Done intialise database.");
}
