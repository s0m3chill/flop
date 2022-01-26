import 'package:application/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  group('Testing full app flow', () {
    IntegrationTestWidgetsFlutterBinding.ensureInitialized();

    testWidgets(
        'Add application config and remove it using flag / outlined flag button',
        (tester) async {
      await tester.pumpWidget(const Application());

      // Activate config
      await tester.tap(find.byIcon(Icons.outlined_flag).first);
      await tester.pumpAndSettle(const Duration(seconds: 1));
      await tester.tap(find.text('Application config 1'));
      expect(find.text('Config activated'), findsOneWidget);

      // Move to activated configs page
      await tester.tap(find.text('Active'));
      await tester.pumpAndSettle();

      // Remove activated config
      await tester.tap(find.byIcon(Icons.flag).first);
      await tester.pumpAndSettle(const Duration(seconds: 1));
      expect(find.text('Config deactivated'), findsOneWidget);
    });
  });
}
