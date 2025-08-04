// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:shapeflow/main.dart';

void main() {
  testWidgets('ShapeFlow app smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const ShapeFlowApp());

    // Verify that the app loads without errors
    expect(find.byType(MaterialApp), findsOneWidget);
  });

  testWidgets('Onboarding screen displays correctly', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const ShapeFlowApp());

    // Verify that the onboarding screen elements are present
    expect(find.text('FITPRO'), findsOneWidget);
    expect(find.text('TRANSFORM'), findsOneWidget);
    expect(find.text('YOUR'), findsOneWidget);
    expect(find.text('LIMITS'), findsOneWidget);
    expect(find.text('Start Your Journey'), findsOneWidget);
    expect(find.text('Sign In Here'), findsOneWidget);
  });
}
