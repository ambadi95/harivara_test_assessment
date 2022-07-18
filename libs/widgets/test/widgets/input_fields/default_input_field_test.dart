import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:widget_library/input_fields/default_input_field.dart';

void main() {
  testWidgets('[DefaultInputField] - should have all default elements',
      (tester) async {
    // Arrange
    String _identifier = 'DefaultInputField';
    final hint = find.byKey(Key('${_identifier}_hint'));
    final textField = find.byKey(Key('${_identifier}_text_field'));
    final accessoryContainer =
        find.byKey(Key('${_identifier}_accessory_container'));
    final accessoryHintContainer =
        find.byKey(Key('${_identifier}_accessory_hint_container'));
    var testWidget = MaterialApp(
      home: Scaffold(
        body: Container(child: DefaultInputField(label: 'Credit card')),
      ),
    );

    // Act
    await tester.pumpWidget(testWidget);
    // Assert
    expect(hint, findsOneWidget);
    expect(textField, findsOneWidget);
    expect(accessoryContainer, findsNothing);
    expect(accessoryHintContainer, findsNothing);
  });

  testWidgets(
      '[DefaultInputField] - should have all default elements and accessory views',
      (tester) async {
    // Arrange
    String _identifier = 'DefaultInputField';
    final hint = find.byKey(Key('${_identifier}_hint'));
    final textField = find.byKey(Key('${_identifier}_text_field'));
    final accessoryContainer =
        find.byKey(Key('${_identifier}_accessory_container'));
    final accessoryHintContainer =
        find.byKey(Key('${_identifier}_accessory_hint_container'));
    var testWidget = MaterialApp(
      home: Scaffold(
        body: Container(
          child: DefaultInputField(
            label: 'Credit card',
            suffixWidget: Container(),
            suffixHintWidget: Container(),
          ),
        ),
      ),
    );

    // Act
    await tester.pumpWidget(testWidget);
    // Assert
    expect(hint, findsOneWidget);
    expect(textField, findsOneWidget);
    expect(accessoryContainer, findsOneWidget);
    expect(accessoryHintContainer, findsOneWidget);
  });

  testWidgets(
      '[DefaultInputField] - card constructor should have correct elements',
      (tester) async {
    // Arrange
    String _identifier = 'DefaultInputField';
    final hint = find.byKey(Key('${_identifier}_hint'));
    final textField = find.byKey(Key('${_identifier}_text_field'));
    final accessoryContainer =
        find.byKey(Key('${_identifier}_accessory_container'));
    final accessoryHintContainer =
        find.byKey(Key('${_identifier}_accessory_hint_container'));
    var testWidget = MaterialApp(
      home: Scaffold(
        body: Container(
          child: DefaultInputField.cardInputField('Credit card'),
        ),
      ),
    );

    // Act
    await tester.pumpWidget(testWidget);
    // Assert
    expect(hint, findsOneWidget);
    expect(textField, findsOneWidget);
    expect(accessoryContainer, findsNothing);
    expect(accessoryHintContainer, findsNothing);
  });

  testWidgets(
      '[DefaultInputField] - card constructor should allow only numbers',
      (tester) async {
    // Arrange
    String _identifier = 'DefaultInputField';
    final hint = find.byKey(Key('${_identifier}_hint'));
    final textField = find.byKey(Key('${_identifier}_text_field'));
    final accessoryContainer =
        find.byKey(Key('${_identifier}_accessory_container'));
    final accessoryHintContainer =
        find.byKey(Key('${_identifier}_accessory_hint_container'));
    var testWidget = MaterialApp(
      home: Scaffold(
        body: Container(
          child: DefaultInputField.cardInputField('Credit card'),
        ),
      ),
    );

    // Act
    await tester.pumpWidget(testWidget);
    await tester.enterText(textField, 'this should not work');
    // Assert
    expect(hint, findsOneWidget);
    expect(textField, findsOneWidget);
    expect(accessoryContainer, findsNothing);
    expect(accessoryHintContainer, findsNothing);
    expect(find.text('this should not work'), findsNothing);
  });

  testWidgets(
      '[DefaultInputField] - card constructor should format card number',
      (tester) async {
    // Arrange
    String _identifier = 'DefaultInputField';
    final hint = find.byKey(Key('${_identifier}_hint'));
    final textField = find.byKey(Key('${_identifier}_text_field'));
    final accessoryContainer =
        find.byKey(Key('${_identifier}_accessory_container'));
    final accessoryHintContainer =
        find.byKey(Key('${_identifier}_accessory_hint_container'));
    var testWidget = MaterialApp(
      home: Scaffold(
        body: Container(
          child: DefaultInputField.cardInputField('Credit card'),
        ),
      ),
    );

    // Act
    await tester.pumpWidget(testWidget);
    await tester.enterText(textField, '1234567890123456');
    // Assert
    expect(hint, findsOneWidget);
    expect(textField, findsOneWidget);
    expect(accessoryContainer, findsNothing);
    expect(accessoryHintContainer, findsNothing);
    expect(find.text('1234-5678-9012-3456'), findsOneWidget);
  });

  testWidgets(
      '[DefaultInputField] - card constructor should allow max 16 characters',
      (tester) async {
    // Arrange
    String _identifier = 'DefaultInputField';
    final hint = find.byKey(Key('${_identifier}_hint'));
    final textField = find.byKey(Key('${_identifier}_text_field'));
    final accessoryContainer =
        find.byKey(Key('${_identifier}_accessory_container'));
    final accessoryHintContainer =
        find.byKey(Key('${_identifier}_accessory_hint_container'));
    var testWidget = MaterialApp(
      home: Scaffold(
        body: Container(
          child: DefaultInputField.cardInputField('Credit card'),
        ),
      ),
    );

    // Act
    await tester.pumpWidget(testWidget);
    await tester.enterText(textField, '123456789012345678901234');
    // Assert
    expect(hint, findsOneWidget);
    expect(textField, findsOneWidget);
    expect(accessoryContainer, findsNothing);
    expect(accessoryHintContainer, findsNothing);
    expect(find.text('1234-5678-9012-3456'), findsOneWidget);
  });

  testWidgets(
      '[DefaultInputField] - card constructor should allow max 16 characters - enter 10',
      (tester) async {
    // Arrange
    String _identifier = 'DefaultInputField';
    final hint = find.byKey(Key('${_identifier}_hint'));
    final textField = find.byKey(Key('${_identifier}_text_field'));
    final accessoryContainer =
        find.byKey(Key('${_identifier}_accessory_container'));
    final accessoryHintContainer =
        find.byKey(Key('${_identifier}_accessory_hint_container'));
    var testWidget = MaterialApp(
      home: Scaffold(
        body: Container(
          child: DefaultInputField.cardInputField('Credit card'),
        ),
      ),
    );

    // Act
    await tester.pumpWidget(testWidget);
    await tester.enterText(textField, '1234567890');
    // Assert
    expect(hint, findsOneWidget);
    expect(textField, findsOneWidget);
    expect(accessoryContainer, findsNothing);
    expect(accessoryHintContainer, findsNothing);
    expect(find.text('1234-5678-90'), findsOneWidget);
  });

  //CVV
  testWidgets(
      '[DefaultInputField] - cvv constructor should have correct elements',
      (tester) async {
    // Arrange
    String _identifier = 'DefaultInputField';
    final hint = find.byKey(Key('${_identifier}_hint'));
    final textField = find.byKey(Key('${_identifier}_text_field'));
    final accessoryContainer =
        find.byKey(Key('${_identifier}_accessory_container'));
    final accessoryHintContainer =
        find.byKey(Key('${_identifier}_accessory_hint_container'));
    var testWidget = MaterialApp(
      home: Scaffold(
        body: Container(
          child: DefaultInputField.cvvInputField(
            'Credit card',
            false,
            FocusNode(),
          ),
        ),
      ),
    );

    // Act
    await tester.pumpWidget(testWidget);
    // Assert
    expect(hint, findsOneWidget);
    expect(textField, findsOneWidget);
    expect(accessoryContainer, findsNothing);
    expect(accessoryHintContainer, findsNothing);
  });

  testWidgets('[DefaultInputField] - cvv constructor should allow only numbers',
      (tester) async {
    // Arrange
    String _identifier = 'DefaultInputField';
    final hint = find.byKey(Key('${_identifier}_hint'));
    final textField = find.byKey(Key('${_identifier}_text_field'));
    final accessoryContainer =
        find.byKey(Key('${_identifier}_accessory_container'));
    final accessoryHintContainer =
        find.byKey(Key('${_identifier}_accessory_hint_container'));
    var testWidget = MaterialApp(
      home: Scaffold(
        body: Container(
          child: DefaultInputField.cvvInputField(
            'Credit card',
            false,
            FocusNode(),
          ),
        ),
      ),
    );

    // Act
    await tester.pumpWidget(testWidget);
    await tester.enterText(textField, 'this should not work');
    // Assert
    expect(hint, findsOneWidget);
    expect(textField, findsOneWidget);
    expect(accessoryContainer, findsNothing);
    expect(accessoryHintContainer, findsNothing);
    expect(find.text('this should not work'), findsNothing);
  });

  testWidgets(
      '[DefaultInputField] - cvv constructor should allow max 4 characters',
      (tester) async {
    // Arrange
    String _identifier = 'DefaultInputField';
    final hint = find.byKey(Key('${_identifier}_hint'));
    final textField = find.byKey(Key('${_identifier}_text_field'));
    final accessoryContainer =
        find.byKey(Key('${_identifier}_accessory_container'));
    final accessoryHintContainer =
        find.byKey(Key('${_identifier}_accessory_hint_container'));
    var testWidget = MaterialApp(
      home: Scaffold(
        body: Container(
          child: DefaultInputField.cvvInputField(
            'Credit card',
            false,
            FocusNode(),
          ),
        ),
      ),
    );

    // Act
    await tester.pumpWidget(testWidget);
    await tester.enterText(textField, '123456789012345678901234');
    // Assert
    expect(hint, findsOneWidget);
    expect(textField, findsOneWidget);
    expect(accessoryContainer, findsNothing);
    expect(accessoryHintContainer, findsNothing);
    expect(find.text('1234'), findsOneWidget);
  });

  testWidgets(
      '[DefaultInputField] - card constructor should allow max 4 characters - enter 2',
      (tester) async {
    // Arrange
    String _identifier = 'DefaultInputField';
    final hint = find.byKey(Key('${_identifier}_hint'));
    final textField = find.byKey(Key('${_identifier}_text_field'));
    final accessoryContainer =
        find.byKey(Key('${_identifier}_accessory_container'));
    final accessoryHintContainer =
        find.byKey(Key('${_identifier}_accessory_hint_container'));
    var testWidget = MaterialApp(
      home: Scaffold(
        body: Container(
          child: DefaultInputField.cardInputField('Credit card'),
        ),
      ),
    );

    // Act
    await tester.pumpWidget(testWidget);
    await tester.enterText(textField, '12');
    // Assert
    expect(hint, findsOneWidget);
    expect(textField, findsOneWidget);
    expect(accessoryContainer, findsNothing);
    expect(accessoryHintContainer, findsNothing);
    expect(find.text('12'), findsOneWidget);
  });

  testWidgets('[DefaultInputField] - nickname field should have proper values',
      (tester) async {
    // Arrange
    String _identifier = 'DefaultInputField';
    final hint = find.byKey(Key('${_identifier}_hint'));
    final textField = find.byKey(Key('${_identifier}_text_field'));
    final accessoryContainer =
        find.byKey(Key('${_identifier}_accessory_container'));
    final accessoryHintContainer =
        find.byKey(Key('${_identifier}_accessory_hint_container'));
    var testWidget = MaterialApp(
      home: Scaffold(
        body: Container(
          child: DefaultInputField.nicknameInputField('Nickname'),
        ),
      ),
    );

    // Act
    await tester.pumpWidget(testWidget);
    await tester.enterText(textField, '12');
    // Assert
    expect(hint, findsOneWidget);
    expect(textField, findsOneWidget);
    expect(accessoryContainer, findsNothing);
    expect(accessoryHintContainer, findsNothing);
    expect(find.text('12'), findsOneWidget);
  });

  testWidgets('[DefaultInputField] - nickname field should format input',
      (tester) async {
    // Arrange
    String _identifier = 'DefaultInputField';
    final hint = find.byKey(Key('${_identifier}_hint'));
    final textField = find.byKey(Key('${_identifier}_text_field'));
    final accessoryContainer =
        find.byKey(Key('${_identifier}_accessory_container'));
    final accessoryHintContainer =
        find.byKey(Key('${_identifier}_accessory_hint_container'));
    var testWidget = MaterialApp(
      home: Scaffold(
        body: Container(
          child: DefaultInputField.nicknameInputField('Nickname'),
        ),
      ),
    );

    // Act
    await tester.pumpWidget(testWidget);
    await tester.enterText(textField, 'THIS shuld Be F');
    // Assert
    expect(hint, findsOneWidget);
    expect(textField, findsOneWidget);
    expect(accessoryContainer, findsNothing);
    expect(accessoryHintContainer, findsNothing);
    expect(find.text('This Shuld Be F'), findsOneWidget);
  });
}
