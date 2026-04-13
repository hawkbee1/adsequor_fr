import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:adsequor_fr/screens/platforms_section.dart';
import '../helpers/test_helper.dart';

void main() {
  group('PlatformsSection', () {
    testWidgets('displays header title', (tester) async {
      await tester.pumpWidget(
        buildTestableWidget(
          const SingleChildScrollView(child: PlatformsSection()),
        ),
      );
      expect(find.text('Run Everywhere'), findsOneWidget);
    });

    testWidgets('displays platform names', (tester) async {
      await tester.pumpWidget(
        buildTestableWidget(
          const SingleChildScrollView(child: PlatformsSection()),
        ),
      );
      expect(find.text('Android & iOS'), findsOneWidget);
      expect(find.text('Web Application'), findsOneWidget);
      expect(find.text('macOS'), findsOneWidget);
      expect(find.text('Windows'), findsOneWidget);
      expect(find.text('Linux'), findsOneWidget);
      expect(find.text('Web Server (Appwrite)'), findsOneWidget);
    });
  });
}
