import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:adsequor_fr/main.dart';
import 'package:adsequor_fr/screens/one_page_screen.dart';

void main() {
  group('MyApp', () {
    setUp(() {
      SharedPreferences.setMockInitialValues({});
    });

    testWidgets('renders MaterialApp with OnePageScreen', (tester) async {
      await tester.pumpWidget(const ProviderScope(child: MyApp()));
      await tester.pumpAndSettle();
      expect(find.byType(MaterialApp), findsOneWidget);
      expect(find.byType(OnePageScreen), findsOneWidget);
    });

    testWidgets('has correct title', (tester) async {
      await tester.pumpWidget(const ProviderScope(child: MyApp()));
      await tester.pumpAndSettle();
      final MaterialApp app = tester.widget(find.byType(MaterialApp));
      expect(app.title, 'Adsequor');
    });

    testWidgets('does not show debug banner', (tester) async {
      await tester.pumpWidget(const ProviderScope(child: MyApp()));
      await tester.pumpAndSettle();
      final MaterialApp app = tester.widget(find.byType(MaterialApp));
      expect(app.debugShowCheckedModeBanner, false);
    });
  });
}
