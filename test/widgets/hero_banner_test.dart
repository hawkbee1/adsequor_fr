import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:adsequor_fr/widgets/hero_banner.dart';
import '../helpers/test_helper.dart';

void main() {
  group('HeroBanner', () {
    testWidgets('displays subtitle text', (tester) async {
      await tester.pumpWidget(
        buildTestableWidget(
          const SingleChildScrollView(
            child: HeroBanner(title: 'Adsequor', subtitle: 'Test Subtitle'),
          ),
        ),
      );
      expect(find.text('Test Subtitle'), findsOneWidget);
    });

    testWidgets('displays description when provided', (tester) async {
      await tester.pumpWidget(
        buildTestableWidget(
          const SingleChildScrollView(
            child: HeroBanner(
              title: 'Adsequor',
              subtitle: 'Subtitle',
              description: 'A detailed description',
            ),
          ),
        ),
      );
      expect(find.text('A detailed description'), findsOneWidget);
    });

    testWidgets('does not display description when null', (tester) async {
      await tester.pumpWidget(
        buildTestableWidget(
          const SingleChildScrollView(
            child: HeroBanner(title: 'Test', subtitle: 'Sub'),
          ),
        ),
      );
      expect(find.text('A detailed description'), findsNothing);
    });

    testWidgets('contains ScheduleNow button', (tester) async {
      await tester.pumpWidget(
        buildTestableWidget(
          const SingleChildScrollView(
            child: HeroBanner(title: 'Test', subtitle: 'Sub'),
          ),
        ),
      );
      expect(find.text('Schedule Now'), findsOneWidget);
    });
  });
}
