import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:adsequor_fr/models/service.dart';
import 'package:adsequor_fr/widgets/service_card.dart';
import '../helpers/test_helper.dart';

void main() {
  const testService = Service(
    id: 'test',
    title: 'Test Service',
    description: 'A description',
    imageUrl: 'assets/test.png',
    features: ['Feature A', 'Feature B'],
  );

  group('ServiceCard', () {
    testWidgets('displays service title', (tester) async {
      await tester.pumpWidget(
        buildTestableWidget(
          const SingleChildScrollView(child: ServiceCard(service: testService)),
        ),
      );
      expect(find.text('Test Service'), findsOneWidget);
    });

    testWidgets('displays service description', (tester) async {
      await tester.pumpWidget(
        buildTestableWidget(
          const SingleChildScrollView(child: ServiceCard(service: testService)),
        ),
      );
      expect(find.text('A description'), findsOneWidget);
    });

    testWidgets('shows features when expanded', (tester) async {
      await tester.pumpWidget(
        buildTestableWidget(
          const SingleChildScrollView(
            child: ServiceCard(service: testService, isExpanded: true),
          ),
        ),
      );
      expect(find.text('Feature A'), findsOneWidget);
      expect(find.text('Feature B'), findsOneWidget);
      expect(find.text('Key Features:'), findsOneWidget);
    });

    testWidgets('hides features when not expanded', (tester) async {
      await tester.pumpWidget(
        buildTestableWidget(
          const SingleChildScrollView(
            child: ServiceCard(service: testService, isExpanded: false),
          ),
        ),
      );
      expect(find.text('Key Features:'), findsNothing);
    });

    testWidgets('shows Learn More when not expanded', (tester) async {
      await tester.pumpWidget(
        buildTestableWidget(
          const SingleChildScrollView(
            child: ServiceCard(service: testService, isExpanded: false),
          ),
        ),
      );
      expect(find.text('Learn More'), findsOneWidget);
    });

    testWidgets('shows Inquire button when expanded', (tester) async {
      await tester.pumpWidget(
        buildTestableWidget(
          const SingleChildScrollView(
            child: ServiceCard(service: testService, isExpanded: true),
          ),
        ),
      );
      expect(find.text('Inquire About This Service'), findsOneWidget);
    });
  });
}
