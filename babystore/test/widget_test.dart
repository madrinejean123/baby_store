import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:firebase_analytics/firebase_analytics.dart'; // Import Firebase Analytics
import 'package:shop/main.dart'; // Import your main app

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Create a mock FirebaseAnalytics instance (you can use a mock library like mockito or just an instance here)
    FirebaseAnalytics analytics = FirebaseAnalytics.instance;

    // Build our app and pass the mock FirebaseAnalytics instance to MyApp
    await tester.pumpWidget(MyApp(analytics: analytics));

    // Verify that our counter starts at 0.
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });
}
