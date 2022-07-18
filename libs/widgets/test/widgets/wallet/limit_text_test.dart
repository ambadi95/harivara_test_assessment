import 'package:widget_library/wallet/limit_text.dart';
import 'package:core/app/crayon_payment_material_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late Widget testWidget;

  testWidgets('Should have text value', (tester) async {
    //Arrange
    testWidget = CrayonPaymentMaterialApp(
      home: const LimitText('0.0'),
    );
    final limitText = find.byKey(const Key('limitText_arabic'));
    //Act
    await tester.pumpWidget(testWidget);
    //Assert
    expect(limitText, findsOneWidget);
  });

  testWidgets('should show value passed in constructor', (tester) async {
    //Arrange
    const limit = '20000.0';
    testWidget = CrayonPaymentMaterialApp(
      home: const LimitText(limit),
    );
    final limitFinder = find.textContaining(limit);
    //Act
    await tester.pumpWidget(testWidget);
    //Assert
    expect(limitFinder, findsOneWidget);
  });

  group('Test case for checking the localization for arabic and english', () {
    setUp(() {
      testWidget = CrayonPaymentMaterialApp(
        locale: Locale('en'),
        home: Scaffold(
          body: LimitText('Text'),
        ),
      );
    });

    testWidgets(
        'in this test case we are checking if language is english '
        'or not through the locale', (tester) async {
      // Arrange
      final localeFinder = find.byKey(const Key('limitText_english'));
      // Act
      await tester.pumpWidget(testWidget);
      // Assert
      expect(localeFinder, findsOneWidget);
    });
  });
}
