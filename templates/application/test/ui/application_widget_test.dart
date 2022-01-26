import 'package:application/business_layer/models/application_model.dart';
import 'package:application/presentation_layer/screens/application_main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

Widget createHomeScreen() => ChangeNotifierProvider<ApplicationModel>(
      create: (context) => ApplicationModel(),
      child: const MaterialApp(
        home: ApplicationMainScreen(),
      ),
    );

void main() {
  group('Home Page Widget Tests', () {
    testWidgets('Title should be visible', (tester) async {
      await tester.pumpWidget(createHomeScreen());
      expect(find.text('Application Config Testing'), findsOneWidget);
    });

    testWidgets('ApplicationModel should be visible', (tester) async {
      await tester.pumpWidget(createHomeScreen());
      expect(find.byKey(const Key('application')), findsOneWidget);
    });

    testWidgets('Config list should be visible', (tester) async {
      await tester.pumpWidget(createHomeScreen());
      expect(find.byType(ListView), findsOneWidget);
    });

    testWidgets('Scroll test', (tester) async {
      await tester.pumpWidget(createHomeScreen());
      expect(find.text('Application config 0'), findsOneWidget);

      await tester.fling(find.byType(ListView), const Offset(0, -200), 3000);
      await tester.pumpAndSettle();

      expect(find.text('Application config 0'), findsNothing);
    });

    testWidgets('Configs should be activated and deactivated', (tester) async {
      await tester.pumpWidget(createHomeScreen());

      await tester.tap(find.byIcon(Icons.outlined_flag).first);
      await tester.pumpAndSettle(const Duration(seconds: 1));

      expect(find.text('Config activated'), findsOneWidget);

      expect(find.byIcon(Icons.flag), findsWidgets);

      await tester.tap(find.byIcon(Icons.flag).first);
      await tester.pumpAndSettle(const Duration(seconds: 1));

      expect(find.text('Config deactivated'), findsOneWidget);
    });
  });
}
