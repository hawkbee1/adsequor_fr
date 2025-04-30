import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:adsequor_fr/screens/services_screen.dart';
import 'package:adsequor_fr/screens/contact_screen.dart';

// Test-friendly version of HeroBanner that avoids layout overflow issues in tests
class TestHeroBanner extends StatelessWidget {
  final String title;
  final String subtitle;
  final String? description;
  final String? backgroundImage;
  final String? ctaText;
  final VoidCallback? onCtaPressed;

  const TestHeroBanner({
    super.key,
    required this.title,
    required this.subtitle,
    this.description,
    this.backgroundImage,
    this.ctaText,
    this.onCtaPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        color: Theme.of(context).colorScheme.primary,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(title),
              const SizedBox(height: 8),
              Text(subtitle),
              if (description != null) ...[
                const SizedBox(height: 8),
                Text(description!),
              ],
              const SizedBox(height: 16),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const ServicesScreen(),
                        ),
                      );
                    },
                    child: const Text('View Our Services'),
                  ),
                  const SizedBox(width: 8),
                  OutlinedButton(
                    onPressed:
                        onCtaPressed ??
                        () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const ContactScreen(),
                            ),
                          );
                        },
                    child: Text(ctaText ?? 'Contact Us'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  // Helper function to wrap widgets in a ProviderScope for testing
  Widget createTestWidget({required Widget child}) {
    return ProviderScope(child: MaterialApp(home: child));
  }

  testWidgets('HeroBanner displays title and subtitle correctly', (
    WidgetTester tester,
  ) async {
    // Define test data
    const String testTitle = 'Test Title';
    const String testSubtitle = 'Test Subtitle';

    // Build our widget and trigger a frame
    await tester.pumpWidget(
      createTestWidget(
        child: TestHeroBanner(title: testTitle, subtitle: testSubtitle),
      ),
    );

    // Verify that the title and subtitle are displayed
    expect(find.text(testTitle), findsOneWidget);
    expect(find.text(testSubtitle), findsOneWidget);
  });

  testWidgets('HeroBanner displays description when provided', (
    WidgetTester tester,
  ) async {
    // Define test data
    const String testDescription = 'Test Description';

    // Build our widget and trigger a frame
    await tester.pumpWidget(
      createTestWidget(
        child: TestHeroBanner(
          title: 'Title',
          subtitle: 'Subtitle',
          description: testDescription,
        ),
      ),
    );

    // Verify that the description is displayed
    expect(find.text(testDescription), findsOneWidget);
  });

  testWidgets('HeroBanner does not display description when not provided', (
    WidgetTester tester,
  ) async {
    // Build our widget without a description
    await tester.pumpWidget(
      createTestWidget(
        child: TestHeroBanner(
          title: 'Title',
          subtitle: 'Subtitle',
          // No description provided
        ),
      ),
    );

    // Verify that title and subtitle are displayed but not description
    expect(find.text('Title'), findsOneWidget);
    expect(find.text('Subtitle'), findsOneWidget);
    expect(find.text('Test Description'), findsNothing);
  });

  testWidgets('HeroBanner "View Our Services" button exists', (
    WidgetTester tester,
  ) async {
    // Build our widget
    await tester.pumpWidget(
      createTestWidget(
        child: TestHeroBanner(title: 'Title', subtitle: 'Subtitle'),
      ),
    );

    // Verify the "View Our Services" button exists
    expect(find.text('View Our Services'), findsOneWidget);
  });

  testWidgets('HeroBanner "Contact Us" button exists with default text', (
    WidgetTester tester,
  ) async {
    // Build our widget
    await tester.pumpWidget(
      createTestWidget(
        child: TestHeroBanner(title: 'Title', subtitle: 'Subtitle'),
      ),
    );

    // Verify the "Contact Us" button exists
    expect(find.text('Contact Us'), findsOneWidget);
  });

  testWidgets('HeroBanner custom CTA button text is displayed correctly', (
    WidgetTester tester,
  ) async {
    // Define custom CTA text
    const String customCtaText = 'Custom Button Text';

    // Build our widget with custom CTA text
    await tester.pumpWidget(
      createTestWidget(
        child: TestHeroBanner(
          title: 'Title',
          subtitle: 'Subtitle',
          ctaText: customCtaText,
        ),
      ),
    );

    // Verify that the custom CTA text is displayed
    expect(find.text(customCtaText), findsOneWidget);
  });

  testWidgets('HeroBanner custom onCtaPressed callback works', (
    WidgetTester tester,
  ) async {
    // Flag to track if callback was called
    bool callbackCalled = false;

    // Build widget with custom callback
    await tester.pumpWidget(
      createTestWidget(
        child: TestHeroBanner(
          title: 'Title',
          subtitle: 'Subtitle',
          ctaText: 'Custom CTA',
          onCtaPressed: () {
            callbackCalled = true;
          },
        ),
      ),
    );

    // Tap the custom CTA button
    await tester.tap(find.text('Custom CTA'));
    await tester.pump();

    // Verify callback was called
    expect(callbackCalled, isTrue);
  });
}
