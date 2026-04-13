import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:adsequor_fr/widgets/app_footer.dart';
import '../helpers/test_helper.dart';

void main() {
  group('AppFooter', () {
    testWidgets('displays company name', (tester) async {
      await tester.pumpWidget(
        buildTestableWidget(const SingleChildScrollView(child: AppFooter())),
      );
      expect(find.text('Adsequor'), findsOneWidget);
    });

    testWidgets('displays location', (tester) async {
      await tester.pumpWidget(
        buildTestableWidget(const SingleChildScrollView(child: AppFooter())),
      );
      expect(find.text('Normandy, France'), findsOneWidget);
    });

    testWidgets('displays founded year', (tester) async {
      await tester.pumpWidget(
        buildTestableWidget(const SingleChildScrollView(child: AppFooter())),
      );
      expect(find.text('Founded in 2002'), findsOneWidget);
    });

    testWidgets('displays Built with Flutter', (tester) async {
      await tester.pumpWidget(
        buildTestableWidget(const SingleChildScrollView(child: AppFooter())),
      );
      expect(find.text('Built with Flutter'), findsOneWidget);
    });

    testWidgets('contains social buttons', (tester) async {
      await tester.pumpWidget(
        buildTestableWidget(const SingleChildScrollView(child: AppFooter())),
      );
      expect(find.byTooltip('LinkedIn'), findsOneWidget);
      expect(find.byTooltip('GitHub'), findsOneWidget);
    });
  });
}
