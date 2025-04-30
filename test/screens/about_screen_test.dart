import 'package:flutter_test/flutter_test.dart';
import 'package:adsequor_fr/screens/about_screen.dart';
import 'package:adsequor_fr/widgets/app_nav_bar.dart';
import 'package:adsequor_fr/widgets/app_footer.dart';
import '../helpers/test_utils.dart';

void main() {
  // Configure test environment
  setUpAll(() {
    TestWidgetsFlutterBinding.ensureInitialized();
    TestUtils.setupTestScreenSize();
    TestUtils.setupAssetMocking();
  });

  // Clean up after tests
  tearDownAll(() {
    TestUtils.clearTestScreenSize();
  });

  testWidgets('AboutScreen displays header correctly', (
    WidgetTester tester,
  ) async {
    // Build the actual AboutScreen widget
    await tester.pumpWidget(
      TestUtils.createTestWidget(child: const AboutScreen()),
    );

    // Wait for all images to load and animations to complete
    await tester.pumpAndSettle(const Duration(seconds: 1));

    // Verify the header content
    expect(find.text('About Adsequor'), findsWidgets);
  });

  testWidgets('AboutScreen displays navbar and footer', (
    WidgetTester tester,
  ) async {
    // Build the AboutScreen widget
    await tester.pumpWidget(
      TestUtils.createTestWidget(child: const AboutScreen()),
    );

    // Wait for all images to load and animations to complete
    await tester.pumpAndSettle(const Duration(seconds: 1));

    // Verify navbar and footer are displayed
    expect(find.byType(AppNavBar), findsOneWidget);
    expect(find.byType(AppFooter), findsOneWidget);
  });

  testWidgets('AboutScreen displays company story section', (
    WidgetTester tester,
  ) async {
    // Build the AboutScreen widget
    await tester.pumpWidget(
      TestUtils.createTestWidget(child: const AboutScreen()),
    );

    // Wait for all images to load and animations to complete
    await tester.pumpAndSettle(const Duration(seconds: 1));

    // Verify the company story section exists
    expect(find.text('Our Story'), findsOneWidget);
  });

  test('String manipulation for capitalization works correctly', () {
    // Test basic string capitalization without using extension methods
    String capitalizeString(String s) =>
        s.isNotEmpty ? '${s[0].toUpperCase()}${s.substring(1)}' : '';

    expect(capitalizeString('test'), equals('Test'));
    expect(capitalizeString('hello'), equals('Hello'));
    expect(capitalizeString('a'), equals('A'));
    expect(capitalizeString(''), equals(''));
  });
}
