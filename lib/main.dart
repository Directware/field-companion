import 'package:easy_localization/easy_localization.dart';
import 'package:field_companion/features/core/presentation/providers/database_provider.dart';
import 'package:field_companion/features/core/presentation/providers/shared_preferences_provider.dart';
import 'package:field_companion/features/core/presentation/widgets/field_companion.dart';
import 'package:field_companion/features/field_service/domain/models/report.dart';
import 'package:field_companion/features/field_service/domain/models/studies.dart';
import 'package:field_companion/features/territories/domain/models/territory.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stack_trace/stack_trace.dart' as stack_trace;
import 'package:telemetrydecksdk/telemetrydecksdk.dart';

const String accessToken = String.fromEnvironment("PUBLIC_ACCESS_TOKEN");

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Telemetrydecksdk.start(
    const TelemetryManagerConfiguration(
      appID: String.fromEnvironment('TD_APP_ID'),
      testMode: String.fromEnvironment('TD_PROD') != "true",
    ),
  );

  Telemetrydecksdk.send("appStarted");

  FlutterError.demangleStackTrace = (StackTrace stack) {
    if (stack is stack_trace.Trace) return stack.vmTrace;
    if (stack is stack_trace.Chain) return stack.toTrace().vmTrace;
    return stack;
  };

  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  MapboxOptions.setAccessToken(accessToken);

  final sharedPreferences = await SharedPreferences.getInstance();
  final appDir = await getApplicationDocumentsDirectory();
  final database = await Isar.open(
    [ReportSchema, StudiesSchema, TerritorySchema],
    directory: appDir.path,
  );

  final userLanguage = sharedPreferences.getString('UserLanguage');

  runApp(
    ProviderScope(
      overrides: [
        sharedPreferencesProvider.overrideWith((ref) => sharedPreferences),
        databaseProvider.overrideWith((ref) => database),
      ],
      observers: const [],
      child: EasyLocalization(
        supportedLocales: const [
          Locale('en'),
          Locale('de'),
          Locale('pl'),
        ],
        path: 'assets/i18n',
        saveLocale: false,
        useFallbackTranslations: true,
        startLocale: userLanguage != null ? Locale(userLanguage) : null,
        useOnlyLangCode: true,
        fallbackLocale: const Locale('en', 'US'),
        child: const FieldCompanion(),
      ),
    ),
  );
}
