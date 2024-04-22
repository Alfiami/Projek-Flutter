import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_application/main.dart';

void main() {
  testWidgets('MyApp Widget Test', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: MyApp(),
    ));

    // Verify that the text 'Profile' is displayed.
    expect(find.text('Profile'), findsOneWidget);

    // Verify that the 'Data Diri' text is displayed.
    expect(find.text('Data Diri'), findsOneWidget);

    // Verify that the phone icon is displayed.
    expect(find.byIcon(Icons.phone), findsOneWidget);

    // Verify that the email icon is displayed.
    expect(find.byIcon(Icons.email), findsOneWidget);

    // Verify that the Instagram icon is displayed.
    expect(find.byIcon(Icons.photo_camera), findsOneWidget); // Using photo_camera as placeholder for Instagram
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ProfileScreen(),
    );
  }
}
