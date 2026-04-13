import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:adsequor_fr/screens/metrics_section.dart';
import '../helpers/test_helper.dart';

void main() {
  group('MetricsSection', () {
    testWidgets('displays header title', (tester) async {
      await tester.pumpWidget(
        buildTestableWidget(
          const SingleChildScrollView(child: MetricsSection()),
        ),
      );
      expect(find.text('Why This Stack?'), findsOneWidget);
    });

    testWidgets('displays metric headlines', (tester) async {
      await tester.pumpWidget(
        buildTestableWidget(
          const SingleChildScrollView(child: MetricsSection()),
        ),
      );
      expect(find.text('60% faster development'), findsOneWidget);
      expect(find.text('Up to 50% less code'), findsOneWidget);
      expect(find.text('700% infrastructure savings'), findsOneWidget);
    });

    testWidgets('displays source labels as links', (tester) async {
      await tester.pumpWidget(
        buildTestableWidget(
          const SingleChildScrollView(child: MetricsSection()),
        ),
      );
      expect(find.text('Appwrite — DevKind Case Study'), findsOneWidget);
      expect(find.text('Surf — Flutter vs Native'), findsOneWidget);
    });
  });
}
