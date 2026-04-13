import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:adsequor_fr/screens/tech_stack_section.dart';
import '../helpers/test_helper.dart';

void main() {
  group('TechStackSection', () {
    testWidgets('displays header title', (tester) async {
      await tester.pumpWidget(
        buildTestableWidget(
          const SingleChildScrollView(child: TechStackSection()),
        ),
      );
      expect(find.text('Our Technology Stack'), findsOneWidget);
    });

    testWidgets('displays tech component names', (tester) async {
      await tester.pumpWidget(
        buildTestableWidget(
          const SingleChildScrollView(child: TechStackSection()),
        ),
      );
      // Each tech name appears in both the logo tooltip and the card title
      expect(find.text('Flutter'), findsWidgets);
      expect(find.text('Dart'), findsWidgets);
      expect(find.text('Appwrite'), findsWidgets);
    });

    testWidgets('displays Learn more buttons', (tester) async {
      await tester.pumpWidget(
        buildTestableWidget(
          const SingleChildScrollView(child: TechStackSection()),
        ),
      );
      expect(find.text('Learn more about Flutter'), findsOneWidget);
      expect(find.text('Learn more about Dart'), findsOneWidget);
      expect(find.text('Learn more about Appwrite'), findsOneWidget);
    });
  });
}
