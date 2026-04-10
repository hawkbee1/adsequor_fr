import 'package:adsequor_fr/main.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('home page presents company offer', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    await tester.pumpAndSettle();

    expect(
      find.text('Applications engineered with Dart, Flutter and Appwrite'),
      findsOneWidget,
    );
    expect(find.text('What We Deliver'), findsOneWidget);
    expect(find.text('Dart Engineering'), findsOneWidget);
    expect(find.text('Flutter Applications'), findsOneWidget);
    expect(find.text('Appwrite Backend Platform'), findsOneWidget);
    expect(find.text('Technical stack overview'), findsOneWidget);
    expect(find.text('Where the application runs'), findsOneWidget);
  });
}
