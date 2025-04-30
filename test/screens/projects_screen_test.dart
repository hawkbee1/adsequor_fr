import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:adsequor_fr/screens/projects_screen.dart';
import 'package:adsequor_fr/models/project.dart';
import 'package:adsequor_fr/widgets/app_nav_bar.dart';
import 'package:adsequor_fr/widgets/app_footer.dart';
import '../helpers/test_utils.dart';

void main() {
  // Configure test environment
  setUpAll(() {
    TestWidgetsFlutterBinding.ensureInitialized();
    // Use a wider screen to avoid overflow issues - 1500 pixels wide
    TestUtils.setupTestScreenSize();
    TestUtils.setupAssetMocking();
  });

  tearDownAll(() {
    TestUtils.clearTestScreenSize();
  });

  testWidgets('ProjectsScreen displays header correctly', (
    WidgetTester tester,
  ) async {
    // Build the actual ProjectsScreen widget
    await tester.pumpWidget(
      TestUtils.createTestWidget(child: const ProjectsScreen()),
    );

    // Use pumpAndSettle with a timeout to avoid getting stuck in infinite animations
    await tester.pumpAndSettle(const Duration(seconds: 1));

    // Verify the header content
    expect(find.text('Our Projects'), findsWidgets);
  });

  testWidgets('ProjectsScreen displays navbar and footer', (
    WidgetTester tester,
  ) async {
    // Build the ProjectsScreen widget
    await tester.pumpWidget(
      TestUtils.createTestWidget(child: const ProjectsScreen()),
    );

    // Use pumpAndSettle with a timeout to avoid getting stuck in infinite animations
    await tester.pumpAndSettle(const Duration(seconds: 1));

    // Verify navbar and footer are displayed
    expect(find.byType(AppNavBar), findsOneWidget);
    expect(find.byType(AppFooter), findsOneWidget);
  });

  testWidgets('ProjectsScreen displays project cards', (
    WidgetTester tester,
  ) async {
    // Build the ProjectsScreen widget
    await tester.pumpWidget(
      TestUtils.createTestWidget(child: const ProjectsScreen()),
    );

    // Use pumpAndSettle with a timeout to avoid getting stuck in infinite animations
    await tester.pumpAndSettle(const Duration(seconds: 1));

    // Verify that the Card widget is displayed, indicating project cards are rendered
    expect(find.byType(Card), findsWidgets);
  });

  test('Project model correctly represents project data', () {
    // Test the Project model
    final project = Project(
      title: 'Test Project',
      client: 'Test Client',
      duration: '2023-2024',
      description: 'Test Description',
      achievements: ['Achievement 1', 'Achievement 2'],
      technologies: ['Tech 1', 'Tech 2'],
    );

    expect(project.title, equals('Test Project'));
    expect(project.client, equals('Test Client'));
    expect(project.achievements.length, equals(2));
    expect(project.technologies.length, equals(2));
  });

  test('Testimonial model correctly represents testimonial data', () {
    // Test the Testimonial model
    final testimonial = Testimonial(
      quote: 'This is a test quote',
      author: 'Test Author',
      position: 'Test Position',
      company: 'Test Company',
    );

    expect(testimonial.quote, equals('This is a test quote'));
    expect(testimonial.author, equals('Test Author'));
    expect(testimonial.position, equals('Test Position'));
    expect(testimonial.company, equals('Test Company'));
  });
}
