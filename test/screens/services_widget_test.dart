import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:adsequor_fr/screens/services_widget.dart';
import '../helpers/test_helper.dart';

void main() {
  group('ServicesWidget', () {
    testWidgets('displays header title', (tester) async {
      await tester.pumpWidget(
        buildTestableWidget(
          const SingleChildScrollView(child: ServicesWidget()),
        ),
      );
      expect(find.text('Our Services'), findsOneWidget);
    });

    testWidgets('displays all service titles', (tester) async {
      await tester.pumpWidget(
        buildTestableWidget(
          const SingleChildScrollView(child: ServicesWidget()),
        ),
      );
      expect(find.text('Application Development'), findsOneWidget);
      expect(find.text('Backend Platform with Appwrite'), findsOneWidget);
      expect(find.text('Technical Consulting'), findsOneWidget);
    });

    testWidgets('displays service descriptions', (tester) async {
      await tester.pumpWidget(
        buildTestableWidget(
          const SingleChildScrollView(child: ServicesWidget()),
        ),
      );
      // Check for partial text in descriptions
      expect(find.textContaining('Flutter'), findsWidgets);
    });
  });
}
