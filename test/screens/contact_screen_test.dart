import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:adsequor_fr/screens/contact_screen.dart';
import '../helpers/test_utils.dart';

void main() {
  // Configure test window size and asset mocking
  setUpAll(() {
    TestWidgetsFlutterBinding.ensureInitialized();
    TestUtils.setupTestScreenSize();
    TestUtils.setupAssetMocking();
  });

  // Clean up after tests
  tearDownAll(() {
    TestUtils.clearTestScreenSize();
  });

  testWidgets('Contact screen renders properly', (WidgetTester tester) async {
    // Build the contact screen widget
    await tester.pumpWidget(
      TestUtils.createTestWidget(child: const ContactScreen()),
    );

    // Verify that the contact form is rendered
    expect(find.text('Contact Us'), findsOneWidget);
    expect(
      find.byType(TextFormField),
      findsAtLeast(3),
    ); // Name, email, and message fields
    expect(find.byType(ElevatedButton), findsOneWidget); // Submit button
  });
}
