import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

/// A collection of utility functions for Flutter testing
class TestUtils {

  /// Creates a widget wrapped in ProviderScope and MaterialApp for testing
  static Widget createTestWidget({required Widget child}) {
    return ProviderScope(child: MaterialApp(home: child));
  }

  /// Configure test window size to a standard desktop size
  static void setupTestScreenSize() {
    final dpi =
        TestWidgetsFlutterBinding
            .instance
            .platformDispatcher
            .views
            .first
            .devicePixelRatio;
    final width = 1024;
    final height = 1500;

    final testFlutterView =
        TestWidgetsFlutterBinding.instance.platformDispatcher.views.first;
    testFlutterView.physicalSize = Size(width * dpi, height * dpi);
  }

  /// Reset the test screen size
  static void clearTestScreenSize() {
    final testFlutterView =
        TestWidgetsFlutterBinding.instance.platformDispatcher.views.first;
    testFlutterView.resetPhysicalSize();
  }
}
