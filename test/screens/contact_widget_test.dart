import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:adsequor_fr/screens/contact_widget.dart';
import '../helpers/test_helper.dart';

void main() {
  group('ContactWidget', () {
    testWidgets('displays header title', (tester) async {
      await tester.pumpWidget(
        buildTestableWidget(
          const SingleChildScrollView(child: ContactWidget()),
        ),
      );
      expect(find.text('Contact Us'), findsOneWidget);
    });

    testWidgets('displays Get In Touch section', (tester) async {
      await tester.pumpWidget(
        buildTestableWidget(
          const SingleChildScrollView(child: ContactWidget()),
        ),
      );
      expect(find.text('Get In Touch'), findsOneWidget);
    });

    testWidgets('displays contact methods', (tester) async {
      await tester.pumpWidget(
        buildTestableWidget(
          const SingleChildScrollView(child: ContactWidget()),
        ),
      );
      expect(find.text('Location'), findsOneWidget);
      expect(find.text('LinkedIn'), findsOneWidget);
      expect(find.text('GitHub'), findsOneWidget);
    });

    testWidgets('displays location icon', (tester) async {
      await tester.pumpWidget(
        buildTestableWidget(
          const SingleChildScrollView(child: ContactWidget()),
        ),
      );
      expect(find.byIcon(Icons.location_on_outlined), findsOneWidget);
    });
  });
}
