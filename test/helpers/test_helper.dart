import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:adsequor_fr/utils/app_theme.dart';

/// Wraps a widget in the required providers for testing.
Widget buildTestableWidget(Widget child, {ThemeData? theme}) {
  return ProviderScope(
    child: MaterialApp(
      theme: theme ?? AppTheme.lightTheme,
      home: Scaffold(body: child),
    ),
  );
}

/// Same as [buildTestableWidget] but sets widget as the home directly.
Widget buildTestableScreen(Widget child, {ThemeData? theme}) {
  return ProviderScope(
    child: MaterialApp(theme: theme ?? AppTheme.lightTheme, home: child),
  );
}
