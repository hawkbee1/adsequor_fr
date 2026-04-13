import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:adsequor_fr/widgets/app_nav_bar.dart';
import '../helpers/test_helper.dart';

void main() {
  group('AppNavBar', () {
    setUp(() {
      SharedPreferences.setMockInitialValues({});
    });

    testWidgets('displays company name', (tester) async {
      await tester.pumpWidget(
        buildTestableScreen(const AppNavBar(currentPage: 'home')),
      );
      await tester.pumpAndSettle();
      expect(find.text('Adsequor'), findsOneWidget);
    });

    testWidgets('contains Schedule Now button', (tester) async {
      await tester.pumpWidget(
        buildTestableScreen(const AppNavBar(currentPage: 'home')),
      );
      await tester.pumpAndSettle();
      expect(find.text('Schedule Now'), findsOneWidget);
    });

    testWidgets('has preferred size', (tester) async {
      const navBar = AppNavBar(currentPage: 'home');
      expect(navBar.preferredSize.height, isPositive);
    });
  });
}
