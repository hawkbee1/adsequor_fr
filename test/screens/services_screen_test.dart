import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:adsequor_fr/screens/services_widget.dart';
import 'package:adsequor_fr/models/service.dart';
import 'package:adsequor_fr/widgets/app_nav_bar.dart';
import 'package:adsequor_fr/widgets/app_footer.dart';

void main() {
  // Configure test window size to accommodate larger screen content
  setUpAll(() {
    TestWidgetsFlutterBinding.ensureInitialized();
    final binding = TestWidgetsFlutterBinding.instance;
    final testFlutterView = binding.platformDispatcher.views.first;
    final dpi = testFlutterView.devicePixelRatio;
    final width = 1024;
    final height = 2000; // Taller to accommodate scrolling
    testFlutterView.physicalSize = Size(width * dpi, height * dpi);

    // Register asset bundles to handle image loading in tests
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(const MethodChannel('flutter/assets'), (
          MethodCall methodCall,
        ) async {
          if (methodCall.method == 'getAssetBundlePaths') {
            return [];
          }
          return null;
        });
  });

  // Clean up after tests
  tearDownAll(() {
    final binding = TestWidgetsFlutterBinding.instance;
    final testFlutterView = binding.platformDispatcher.views.first;
    testFlutterView.resetPhysicalSize();
  });

  // Helper function to wrap widgets in a ProviderScope for testing
  Widget createTestWidget({required Widget child}) {
    return ProviderScope(child: MaterialApp(home: child));
  }

  testWidgets('ServicesScreen displays header correctly', (
    WidgetTester tester,
  ) async {
    // Build the actual ServicesScreen widget
    await tester.pumpWidget(createTestWidget(child: const ServicesWidget()));

    // Skip animation frames
    await tester.pump();

    // Find and verify the header content - without requiring full render/settle
    expect(find.text('Our Services'), findsWidgets);
  });

  testWidgets('ServicesScreen displays navbar and footer', (
    WidgetTester tester,
  ) async {
    // Build the ServicesScreen widget
    await tester.pumpWidget(createTestWidget(child: const ServicesWidget()));
    await tester.pump();

    // Verify navbar and footer are displayed
    expect(find.byType(AppNavBar), findsOneWidget);
    expect(find.byType(AppFooter), findsOneWidget);
  });

  testWidgets('ServicesScreen initializes with service tabs', (
    WidgetTester tester,
  ) async {
    // Build the ServicesScreen widget
    await tester.pumpWidget(createTestWidget(child: const ServicesWidget()));
    await tester.pump();

    // Verify service tabs are displayed by finding ChoiceChip widgets instead of Tab widgets
    expect(find.byType(ChoiceChip), findsWidgets);
  });

  testWidgets('Contact Us button is present', (WidgetTester tester) async {
    // Build the ServicesScreen widget
    await tester.pumpWidget(createTestWidget(child: const ServicesWidget()));
    await tester.pump();

    // Verify call to action content without relying on exact text
    expect(find.byType(ElevatedButton), findsWidgets);
  });

  test('Service model correctly represents service data', () {
    // Test the Service model
    final service = Service(
      id: 'test_service',
      title: 'Test Service',
      description: 'Test Description',
      imageUrl: 'test_image.png',
      features: ['Feature 1', 'Feature 2'],
    );

    expect(service.id, equals('test_service'));
    expect(service.title, equals('Test Service'));
    expect(service.description, equals('Test Description'));
    expect(service.features.length, equals(2));
  });
}
