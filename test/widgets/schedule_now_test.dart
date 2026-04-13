import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:adsequor_fr/widgets/schedule_now.dart';
import '../helpers/test_helper.dart';

void main() {
  group('ScheduleNow', () {
    testWidgets('displays Schedule Now text', (tester) async {
      await tester.pumpWidget(buildTestableWidget(const ScheduleNow()));
      expect(find.text('Schedule Now'), findsOneWidget);
    });

    testWidgets('is an ElevatedButton', (tester) async {
      await tester.pumpWidget(buildTestableWidget(const ScheduleNow()));
      expect(find.byType(ElevatedButton), findsOneWidget);
    });
  });
}
