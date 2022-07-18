import 'package:widget_library/wallet/balance_widget.dart';
import 'package:core/app/crayon_payment_material_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late Widget testWidget;
  testWidgets('Should have text value', (tester) async {
    //Arrange
    testWidget = CrayonPaymentMaterialApp(
      home: Scaffold(body: const BalanceWidget('0.0')),
    );
    final balanceText = find.byKey(const Key('balanceText'));
    //Act
    await tester.pumpWidget(testWidget);
    //Assert
    expect(balanceText, findsOneWidget);
  });

  testWidgets('should show value passed in constructor', (tester) async {
    //Arrange
    const amount = '0.10';
    testWidget = CrayonPaymentMaterialApp(
      home: Scaffold(body: const BalanceWidget(amount)),
    );
    final amtfinder = find.textContaining(amount);
    //Act
    await tester.pumpWidget(testWidget);
    //Assert
    expect(amtfinder, findsOneWidget);
  });
}
