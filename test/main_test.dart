import 'package:adsequor_fr/screens/one_page_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:adsequor_fr/main.dart';

void main() {
  testWidgets('MyApp initializes correctly', (WidgetTester tester) async {
    // Build our app and trigger a frame
    await tester.pumpWidget(const ProviderScope(child: MyApp()));

    // Verify that the app contains a MaterialApp
    expect(find.byType(MaterialApp), findsOneWidget);

    // Verify that HomeScreen is the initial route
    expect(find.byType(OnePageScreen), findsOneWidget);
  });

  testWidgets('MyApp applies theme correctly', (WidgetTester tester) async {
    // Build our app and trigger a frame
    await tester.pumpWidget(const ProviderScope(child: MyApp()));

    // Find MaterialApp widget
    final MaterialApp materialApp = tester.widget(find.byType(MaterialApp));

    // Verify theme properties
    expect(materialApp.theme, isNotNull);
    expect(materialApp.darkTheme, isNotNull);
    expect(materialApp.themeMode, isNotNull);
    expect(materialApp.debugShowCheckedModeBanner, isFalse);
    expect(materialApp.title, 'Adsequor');
  });
}
