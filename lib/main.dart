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
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stack_trace/stack_trace.dart' as stack_trace;

void main() async {
  FlutterError.demangleStackTrace = (StackTrace stack) {
    if (stack is stack_trace.Trace) return stack.vmTrace;
    if (stack is stack_trace.Chain) return stack.toTrace().vmTrace;
    return stack;
  };

  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  final Widget easyLocalization = EasyLocalization(
    supportedLocales: const [
      Locale('en', 'US'),
      Locale('de', 'DE'),
      Locale('pl', 'PL'),
    ],
    path: 'assets/i18n',
    saveLocale: false,
    useFallbackTranslations: true,
    useOnlyLangCode: true,
    fallbackLocale: const Locale('en', 'US'),
    child: const FieldCompanion(),
  );

  final sharedPreferences = await SharedPreferences.getInstance();
  final database =
      await Isar.open([ReportSchema, StudiesSchema, TerritorySchema]);

  runApp(
    ProviderScope(
      overrides: [
        sharedPreferencesProvider.overrideWith((ref) => sharedPreferences),
        databaseProvider.overrideWith((ref) => database),
      ],
      observers: const [],
      child: easyLocalization,
    ),
  );
}
