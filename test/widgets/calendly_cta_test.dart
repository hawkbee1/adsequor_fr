import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:adsequor_fr/widgets/calendly_cta.dart';
import '../helpers/test_helper.dart';

void main() {
  group('CalendlyCta', () {
    testWidgets('displays default title and description', (tester) async {
      await tester.pumpWidget(
        buildTestableWidget(const SingleChildScrollView(child: CalendlyCta())),
      );
      expect(find.text('Schedule an Appointment'), findsOneWidget);
    });

    testWidgets('displays custom title and description', (tester) async {
      await tester.pumpWidget(
        buildTestableWidget(
          const SingleChildScrollView(
            child: CalendlyCta(
              title: 'Custom Title',
              description: 'Custom description text',
            ),
          ),
        ),
      );
      expect(find.text('Custom Title'), findsOneWidget);
      expect(find.text('Custom description text'), findsOneWidget);
    });

    testWidgets('displays custom icon', (tester) async {
      await tester.pumpWidget(
        buildTestableWidget(
          const SingleChildScrollView(
            child: CalendlyCta(icon: Icons.emoji_food_beverage),
          ),
        ),
      );
      expect(find.byIcon(Icons.emoji_food_beverage), findsOneWidget);
    });

    testWidgets('contains ScheduleNow button', (tester) async {
      await tester.pumpWidget(
        buildTestableWidget(const SingleChildScrollView(child: CalendlyCta())),
      );
      expect(find.text('Schedule Now'), findsOneWidget);
    });
  });
}
