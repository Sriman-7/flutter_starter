import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_starter/main.dart';

void main() {
  testWidgets('App smoke test - verifies FlutterStarterApp builds without error',
      (WidgetTester tester) async {
    await tester.pumpWidget(const FlutterStarterApp());
    expect(find.byType(FlutterStarterApp), findsOneWidget);
    await tester.pumpAndSettle(const Duration(seconds: 3));
  });
}
