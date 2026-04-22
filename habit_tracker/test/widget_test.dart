import 'package:flutter_test/flutter_test.dart';
import 'package:habit_tracker/main.dart';

void main() {
  testWidgets('App launches', (WidgetTester tester) async {
    await tester.pumpWidget(const HabitTrackerApp());
    expect(find.text('Habitt'), findsOneWidget);
  });
}