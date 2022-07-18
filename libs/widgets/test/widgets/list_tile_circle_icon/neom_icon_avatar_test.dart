import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shared_data_models/transaction/transaction_models/added_funds.dart';
import 'package:shared_data_models/transaction/transaction_category.dart';
import 'package:widget_library/list_tile_circle_icon/crayon_payment_icon_avatar.dart';



class MockAddedFunds extends Mock implements AddedFunds {}

void main() {
  late Widget testWidget;
  late AddedFunds transaction;

  setUp(() {
    transaction = MockAddedFunds();
    when(() => transaction.category)
        .thenReturn(TransactionCategory.addedFunds());

    testWidget = MaterialApp(
      home: Scaffold(
        body: CrayonPaymentIconAvatar('Title', Colors.amber, Colors.amber),
      ),
    );
  });

  testWidgets('finds the widget', (tester) async {
    // Arrange
    final containerFinder = find.byKey(Key('circle_image'));
    // Act
    await tester.pumpWidget(testWidget);
    // Assert
    expect(containerFinder, findsOneWidget);
  });
}
