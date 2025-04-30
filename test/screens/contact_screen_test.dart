import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:adsequor_fr/screens/contact_screen.dart';
import 'package:adsequor_fr/models/company.dart';
import 'package:adsequor_fr/widgets/app_nav_bar.dart';
import 'package:adsequor_fr/widgets/app_footer.dart';
import 'dart:typed_data';

void main() {
  // Configure test window size to accommodate larger screen content
  setUpAll(() {
    TestWidgetsFlutterBinding.ensureInitialized();
    final dpi = TestWidgetsFlutterBinding.instance.window.devicePixelRatio;
    final width = 1024;
    final height = 3000; // Extra tall to accommodate the form and FAQ sections
    TestWidgetsFlutterBinding.instance.window.physicalSizeTestValue = Size(
      width * dpi,
      height * dpi,
    );

    // Properly mock the asset bundle to return dummy data for images
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(const MethodChannel('flutter/assets'), (
          MethodCall methodCall,
        ) async {
          if (methodCall.method == 'getAssetBundlePaths') {
            return <String, dynamic>{};
          }
          // Return a transparent 1x1 pixel for any asset request
          if (methodCall.arguments is String &&
              ((methodCall.arguments as String).endsWith('.jpg') ||
                  (methodCall.arguments as String).endsWith('.png'))) {
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
          return null;
        });
  });

  // Clean up after tests
  tearDownAll(() {
    TestWidgetsFlutterBinding.instance.window.clearPhysicalSizeTestValue();
  });

  // Helper function to wrap widgets in a ProviderScope for testing
  Widget createTestWidget({required Widget child}) {
    return ProviderScope(child: MaterialApp(home: child));
  }

  testWidgets('ContactScreen displays header correctly', (
    WidgetTester tester,
  ) async {
    // Build the actual ContactScreen widget
    await tester.pumpWidget(createTestWidget(child: const ContactScreen()));

    // Wait for all images to load and animations to complete
    await tester.pumpAndSettle(const Duration(milliseconds: 300));

    // Verify the header content
    expect(find.text('Contact Us'), findsWidgets);
  });

  testWidgets('ContactScreen displays navbar and footer', (
    WidgetTester tester,
  ) async {
    // Build the ContactScreen widget
    await tester.pumpWidget(createTestWidget(child: const ContactScreen()));

    // Wait for all images to load and animations to complete
    await tester.pumpAndSettle(const Duration(milliseconds: 300));

    // Verify navbar and footer are displayed
    expect(find.byType(AppNavBar), findsOneWidget);
    expect(find.byType(AppFooter), findsOneWidget);
  });

  testWidgets('ContactScreen displays form fields', (
    WidgetTester tester,
  ) async {
    // Build the ContactScreen widget
    await tester.pumpWidget(createTestWidget(child: const ContactScreen()));

    // Wait for all images to load and animations to complete
    await tester.pumpAndSettle(const Duration(milliseconds: 300));

    // Verify some form fields are displayed - identifying them by type is more reliable
    expect(find.byType(TextFormField), findsWidgets);
    expect(find.byType(ElevatedButton), findsWidgets);
  });

  testWidgets('ContactScreen displays FAQ section', (
    WidgetTester tester,
  ) async {
    // Build the ContactScreen widget
    await tester.pumpWidget(createTestWidget(child: const ContactScreen()));

    // Wait for all images to load and animations to complete
    await tester.pumpAndSettle(const Duration(milliseconds: 300));

    // Look for FAQ section header instead of the ExpansionPanelList
    expect(find.text('Frequently Asked Questions'), findsOneWidget);

    // Alternatively, look for FAQ questions directly
    // Check if at least one FAQ question is visible (title of an expansion panel)
    expect(find.text(adsequorFaqs[0].question), findsOneWidget);
  });

  test('FAQ class works correctly', () {
    // Test the FAQ class constructor
    const faq = FAQ(question: 'Test Question', answer: 'Test Answer');

    expect(faq.question, equals('Test Question'));
    expect(faq.answer, equals('Test Answer'));

    // Test the actual FAQs list contains the expected number of items
    expect(adsequorFaqs.length, greaterThan(0));
  });
}
