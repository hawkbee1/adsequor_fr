import 'package:flutter_test/flutter_test.dart';
import 'package:adsequor_fr/utils/app_theme.dart';
import 'package:flutter/material.dart';

void main() {
  group('AppTheme', () {
    test('seedColor is lightGreen', () {
      expect(AppTheme.seedColor, Colors.lightGreen);
    });

    test('lightTheme uses Material3', () {
      expect(AppTheme.lightTheme.useMaterial3, true);
    });

    test('darkTheme uses Material3', () {
      expect(AppTheme.darkTheme.useMaterial3, true);
    });

    test('lightTheme has light brightness', () {
      expect(AppTheme.lightTheme.brightness, Brightness.light);
    });

    test('darkTheme has dark brightness', () {
      expect(AppTheme.darkTheme.brightness, Brightness.dark);
    });

    test('getTheme returns lightTheme for Brightness.light', () {
      final theme = AppTheme.getTheme(Brightness.light);
      expect(theme, AppTheme.lightTheme);
    });

    test('getTheme returns darkTheme for Brightness.dark', () {
      final theme = AppTheme.getTheme(Brightness.dark);
      expect(theme, AppTheme.darkTheme);
    });

    test('lightTheme has custom appBar theme', () {
      expect(AppTheme.lightTheme.appBarTheme.elevation, 0);
      expect(AppTheme.lightTheme.appBarTheme.centerTitle, false);
    });

    test('lightTheme has card theme with rounded corners', () {
      final shape =
          AppTheme.lightTheme.cardTheme.shape as RoundedRectangleBorder;
      expect(shape.borderRadius, BorderRadius.circular(12));
    });
  });
}
