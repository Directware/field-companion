import 'package:field_companion/features/core/presentation/widget/welcome.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../../../utils/utils.dart';

void main() async {
  group("Welcome widget", () {
    testWidgets("should display some welcome text", (widgetTester) async {
      // GIVEN
      final widget = createWidgetWrapperForTesting(child: const Welcome());

      // WHEN
      await widgetTester.pumpWidget(widget);
      await widgetTester.pumpAndSettle();

      // THEN
      expect(find.text("title"), findsOneWidget);
      expect(find.text("welcome.origin"), findsOneWidget);
      expect(find.text("welcome.feature1"), findsOneWidget);
      expect(find.text("welcome.feature2"), findsOneWidget);
      expect(find.text("welcome.feature3"), findsOneWidget);
      expect(find.text("welcome.feature4"), findsOneWidget);
    });

    group("User interactions", () {
      testWidgets("should display 'continue' button", (widgetTester) async {
        // GIVEN
        final widget = createWidgetWrapperForTesting(child: const Welcome());

        // WHEN
        await widgetTester.pumpWidget(widget);
        await widgetTester.pumpAndSettle();

        // THEN
        expect(find.byType(ElevatedButton), findsOneWidget);
        expect(find.text("actions.continue"), findsOneWidget);
      });
    });
  });
}
