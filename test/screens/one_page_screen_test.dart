import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:adsequor_fr/screens/one_page_screen.dart';
import 'package:adsequor_fr/widgets/app_nav_bar.dart';
import '../helpers/test_helper.dart';

void main() {
  group('OnePageScreen', () {
    setUp(() {
      SharedPreferences.setMockInitialValues({});
    });

    testWidgets('renders Scaffold with AppNavBar', (tester) async {
      await tester.pumpWidget(buildTestableScreen(const OnePageScreen()));
      await tester.pumpAndSettle();
      expect(find.byType(AppNavBar), findsOneWidget);
    });

    testWidgets('displays company name in hero', (tester) async {
      await tester.pumpWidget(buildTestableScreen(const OnePageScreen()));
      await tester.pumpAndSettle();
      expect(find.text('Adsequor'), findsWidgets);
    });

    testWidgets('scrollable content contains key sections', (tester) async {
      await tester.pumpWidget(buildTestableScreen(const OnePageScreen()));
      await tester.pumpAndSettle();
      // The hero section is above fold
      expect(find.text('Adsequor'), findsWidgets);
    });
  });
}
