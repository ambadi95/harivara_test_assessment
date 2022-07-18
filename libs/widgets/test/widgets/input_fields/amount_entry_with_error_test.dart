import 'package:core/ioc/di_container.dart';
import 'package:core/utils/input_formatters/length_text_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:widget_library/input_fields/amount_entry_with_error.dart';

void main() {
  late Widget testWidget;
  String? errorMessage;

  setUp(() {
    DIContainer.container.registerSingleton<LengthTextFormatter>(
      (container) => LengthTextFormatterImpl.forCustomerApp(),
    );

    testWidget = MaterialApp(
      home: Scaffold(
        body: AmountEntryWithError(
          readOnly: false,
          errorMessage: errorMessage,
        ),
      ),
    );
  });

  tearDown(() {
    errorMessage = null;
    DIContainer.container.unregister<LengthTextFormatter>();
  });

  testWidgets('should have all required widgets', (tester) async {
    // Arrange
    final textFieldFinder = find.byKey(const Key('amountTextField'));
    // Act
    await tester.pumpWidget(testWidget);
    // Assert
    expect(textFieldFinder, findsOneWidget);
  });

  group('Error message', () {
    final errorMessageFinder = find.byKey(const Key('errorText'));

    testWidgets('should not show error message when not given', (tester) async {
      // Arrange
      errorMessage = null;
      // Act
      await tester.pumpWidget(testWidget);
      // Assert
      expect(errorMessageFinder, findsNothing);
    });
  });

  group('Test case for error message when given', () {
    setUp(() {
      testWidget = MaterialApp(
        home: Scaffold(
          body: AmountEntryWithError(
            readOnly: false,
            errorMessage: 'errorMessage',
          ),
        ),
      );
    });
    testWidgets('should show error message when given', (tester) async {
      final messageFinder = find.byKey(const Key('errorText'));
      // Arrange
      // Act
      await tester.pumpWidget(testWidget);
      // Assert
      expect(messageFinder, findsOneWidget);
    });
  });
}
