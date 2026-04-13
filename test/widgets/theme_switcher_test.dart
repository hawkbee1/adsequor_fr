import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:adsequor_fr/widgets/theme_switcher.dart';
import 'package:adsequor_fr/utils/app_theme.dart';

void main() {
  group('ThemeSwitcher', () {
    setUp(() {
      SharedPreferences.setMockInitialValues({});
    });

    testWidgets('displays brightness_auto icon initially', (tester) async {
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            theme: AppTheme.lightTheme,
            home: const Scaffold(body: ThemeSwitcher()),
          ),
        ),
      );
      expect(find.byIcon(Icons.brightness_auto), findsOneWidget);
    });

    testWidgets('cycles icon on tap', (tester) async {
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            theme: AppTheme.lightTheme,
            home: const Scaffold(body: ThemeSwitcher()),
          ),
        ),
      );
      // System -> Light
      await tester.tap(find.byType(IconButton));
      await tester.pumpAndSettle();
      expect(find.byIcon(Icons.light_mode), findsOneWidget);

      // Light -> Dark
      await tester.tap(find.byType(IconButton));
      await tester.pumpAndSettle();
      expect(find.byIcon(Icons.dark_mode), findsOneWidget);

      // Dark -> System
      await tester.tap(find.byType(IconButton));
      await tester.pumpAndSettle();
      expect(find.byIcon(Icons.brightness_auto), findsOneWidget);
    });
  });
}
