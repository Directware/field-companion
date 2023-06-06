import 'package:field_companion/features/core/presentation/widgets/field_companion.dart';
import 'package:field_companion/main.dart' as app;
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

const iPhone12Pro = Size(390, 844);

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets("should display initial informations", (tester) async {
    // Build app and trigger a frame.
    app.main();
    await tester.binding.setSurfaceSize(iPhone12Pro);
    await tester.pumpAndSettle();

    // Find inital widget
    expect(find.byType(FieldCompanion), findsOneWidget);

    // App title
    expect(find.text("Field Companion"), findsOneWidget);
    expect(find.text("by Territory Offline"), findsOneWidget);

    // Service feature
    expect(
      find.text("Berichte über den Monat hinweg deinen Dienst"),
      findsOneWidget,
    );

    // Goals feature
    expect(
      find.text("Setze Stundenziele und verfolge deinen Fortschritt"),
      findsOneWidget,
    );

    // Report feature
    expect(
      find.text("Versende deinen Bericht am Monatsende"),
      findsOneWidget,
    );

    // Map feature
    expect(
      find.text("Empfange Gebiete und betrachte sie auf der Karte"),
      findsOneWidget,
    );

    // Proceed button
    expect(find.byType(ElevatedButton), findsOneWidget);
  });
}
