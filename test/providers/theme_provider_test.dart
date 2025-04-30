import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:adsequor_fr/providers/theme_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  setUp(() {
    // Set up fake SharedPreferences
    SharedPreferences.setMockInitialValues({});
  });

  test('ThemeNotifier initializes with system theme', () {
    final themeNotifier = ThemeNotifier();
    expect(themeNotifier.debugState, equals(ThemeMode.system));
  });

  test('toggleTheme cycles through theme modes correctly', () async {
    final themeNotifier = ThemeNotifier();

    // Initial state is system theme
    expect(themeNotifier.debugState, equals(ThemeMode.system));

    // First toggle should go to light theme
    await themeNotifier.toggleTheme();
    expect(themeNotifier.debugState, equals(ThemeMode.light));

    // Second toggle should go to dark theme
    await themeNotifier.toggleTheme();
    expect(themeNotifier.debugState, equals(ThemeMode.dark));

    // Third toggle should go back to system theme
    await themeNotifier.toggleTheme();
    expect(themeNotifier.debugState, equals(ThemeMode.system));
  });

  test('setThemeMode updates theme correctly', () async {
    final themeNotifier = ThemeNotifier();

    // Set to dark theme
    await themeNotifier.setThemeMode(ThemeMode.dark);
    expect(themeNotifier.debugState, equals(ThemeMode.dark));

    // Change to light theme
    await themeNotifier.setThemeMode(ThemeMode.light);
    expect(themeNotifier.debugState, equals(ThemeMode.light));
  });

  test('theme preference is saved to SharedPreferences', () async {
    // Initialize with empty shared preferences
    SharedPreferences.setMockInitialValues({});
    final themeNotifier = ThemeNotifier();

    // Change theme mode
    await themeNotifier.setThemeMode(ThemeMode.dark);

    // Verify preference was saved
    final prefs = await SharedPreferences.getInstance();
    expect(prefs.getString('theme_mode'), equals('dark'));
  });

  test('theme preference is loaded from SharedPreferences', () async {
    // Initialize with dark theme preference
    SharedPreferences.setMockInitialValues({'theme_mode': 'dark'});

    // Create notifier - should load dark theme from preferences
    final themeNotifier = ThemeNotifier();

    // Wait for async _loadThemePreference to complete
    await Future.delayed(const Duration(milliseconds: 10));

    // Verify theme was loaded
    expect(themeNotifier.debugState, equals(ThemeMode.dark));
  });

  testWidgets('themeProvider provides correct theme mode', (
    WidgetTester tester,
  ) async {
    // Create a test widget that uses the themeProvider
    await tester.pumpWidget(
      ProviderScope(
        child: Consumer(
          builder: (context, ref, _) {
            final themeMode = ref.watch(themeProvider);
            return MaterialApp(
              themeMode: themeMode,
              home: Text(themeMode.toString()),
            );
          },
        ),
      ),
    );

    // Initially should display system theme
    expect(find.text('ThemeMode.system'), findsOneWidget);

    // Toggle theme and check update
    await tester.runAsync(() async {
      final container = ProviderScope.containerOf(
        tester.element(find.byType(Consumer)),
      );
      await container.read(themeProvider.notifier).setThemeMode(ThemeMode.dark);
    });
    await tester.pump();
    expect(find.text('ThemeMode.dark'), findsOneWidget);
  });
}
