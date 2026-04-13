import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:adsequor_fr/providers/theme_provider.dart';

void main() {
  group('ThemeNotifier', () {
    setUp(() {
      SharedPreferences.setMockInitialValues({});
    });

    test('initial state is ThemeMode.system', () {
      final container = ProviderContainer();
      addTearDown(container.dispose);

      final themeMode = container.read(themeProvider);
      expect(themeMode, ThemeMode.system);
    });

    test('toggleTheme cycles system -> light -> dark -> system', () async {
      final container = ProviderContainer();
      addTearDown(container.dispose);

      expect(container.read(themeProvider), ThemeMode.system);

      await container.read(themeProvider.notifier).toggleTheme();
      expect(container.read(themeProvider), ThemeMode.light);

      await container.read(themeProvider.notifier).toggleTheme();
      expect(container.read(themeProvider), ThemeMode.dark);

      await container.read(themeProvider.notifier).toggleTheme();
      expect(container.read(themeProvider), ThemeMode.system);
    });

    test('setThemeMode sets the correct mode', () async {
      final container = ProviderContainer();
      addTearDown(container.dispose);

      await container.read(themeProvider.notifier).setThemeMode(ThemeMode.dark);
      expect(container.read(themeProvider), ThemeMode.dark);

      await container
          .read(themeProvider.notifier)
          .setThemeMode(ThemeMode.light);
      expect(container.read(themeProvider), ThemeMode.light);

      await container
          .read(themeProvider.notifier)
          .setThemeMode(ThemeMode.system);
      expect(container.read(themeProvider), ThemeMode.system);
    });

    test('loads saved light theme preference', () async {
      SharedPreferences.setMockInitialValues({'theme_mode': 'light'});

      final container = ProviderContainer();
      addTearDown(container.dispose);

      // Allow async loading to complete
      await Future<void>.delayed(const Duration(milliseconds: 100));
      expect(container.read(themeProvider), ThemeMode.light);
    });

    test('loads saved dark theme preference', () async {
      SharedPreferences.setMockInitialValues({'theme_mode': 'dark'});

      final container = ProviderContainer();
      addTearDown(container.dispose);

      await Future<void>.delayed(const Duration(milliseconds: 100));
      expect(container.read(themeProvider), ThemeMode.dark);
    });

    test('loads saved system theme preference', () async {
      SharedPreferences.setMockInitialValues({'theme_mode': 'system'});

      final container = ProviderContainer();
      addTearDown(container.dispose);

      await Future<void>.delayed(const Duration(milliseconds: 100));
      expect(container.read(themeProvider), ThemeMode.system);
    });

    test('handles null saved preference gracefully', () async {
      SharedPreferences.setMockInitialValues({});

      final container = ProviderContainer();
      addTearDown(container.dispose);

      await Future<void>.delayed(const Duration(milliseconds: 100));
      expect(container.read(themeProvider), ThemeMode.system);
    });
  });
}
