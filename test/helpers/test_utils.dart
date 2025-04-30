import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

/// A collection of utility functions for Flutter testing
class TestUtils {
  /// Sets up asset mocking for tests
  /// This should be called in setUpAll for tests that load assets
  static void setupAssetMocking() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(const MethodChannel('flutter/assets'), (
          MethodCall methodCall,
        ) async {
          if (methodCall.method == 'getAssetBundlePaths') {
            return <String, dynamic>{};
          }

          // For asset manifest
          if (methodCall.arguments is String &&
              (methodCall.arguments as String).contains('AssetManifest')) {
            return '{}';
          }

          // Return a transparent 1x1 pixel for any image asset request
          if (methodCall.arguments is String &&
              ((methodCall.arguments as String).endsWith('.jpg') ||
                  (methodCall.arguments as String).endsWith('.png'))) {
            return _createTransparentImage();
          }
          return null;
        });
  }

  /// Creates a 1x1 transparent PNG image
  static Uint8List _createTransparentImage() {
    // This is a valid 1x1 transparent PNG
    return Uint8List.fromList([
      0x89,
      0x50,
      0x4E,
      0x47,
      0x0D,
      0x0A,
      0x1A,
      0x0A,
      0x00,
      0x00,
      0x00,
      0x0D,
      0x49,
      0x48,
      0x44,
      0x52,
      0x00,
      0x00,
      0x00,
      0x01,
      0x00,
      0x00,
      0x00,
      0x01,
      0x08,
      0x06,
      0x00,
      0x00,
      0x00,
      0x1F,
      0x15,
      0xC4,
      0x89,
      0x00,
      0x00,
      0x00,
      0x0A,
      0x49,
      0x44,
      0x41,
      0x54,
      0x78,
      0x9C,
      0x63,
      0x00,
      0x01,
      0x00,
      0x00,
      0x05,
      0x00,
      0x01,
      0x0D,
      0x0A,
      0x2D,
      0xB4,
      0x00,
      0x00,
      0x00,
      0x00,
      0x49,
      0x45,
      0x4E,
      0x44,
      0xAE,
      0x42,
      0x60,
      0x82,
    ]);
  }

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
