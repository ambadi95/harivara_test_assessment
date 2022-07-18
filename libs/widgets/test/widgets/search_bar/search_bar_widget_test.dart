import 'package:flutter/material.dart';
import 'package:widget_library/search_bar/search_bar_widget.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:widget_library/search_bar/search_bar_widget_model.dart';


void main() {
  late Widget testWidget;
  final iconText = 'Icon-Widget';
  Icon preFixIcon = Icon(
    Icons.search,
    key: Key(iconText),
  );

  final iconFinder = find.byKey(Key(iconText));

  setUp(() {
    testWidget = MaterialApp(
      home: Scaffold(
        body: SearchBarWidget(
          attributes: SearchBarAttributes(
            appearance: SearchBarAppearance(
              prefixIcon: preFixIcon,
            ),
          ),
          onSearch: (value) {},
          onTextChanged: (value) {
            print('Listening $value');
          },
        ),
      ),
    );
  });

  testWidgets('in this test case we are finding error message', (tester) async {
    // Arrange
    final errorText = 'Error text';
    testWidget = MaterialApp(
      home: Scaffold(
        body: SearchBarWidget(
          onErrorInputText: errorText,
          onSearch: (value) {},
          onTextChanged: (value) {
            print('Listening $value');
          },
        ),
      ),
    );
    final errorFinder = find.text(errorText);
    // Act
    await tester.pumpWidget(testWidget);
    // Assert
    expect(errorFinder, findsOneWidget);
  });

  testWidgets('checking for the search bar icon button', (tester) async {
    // Arrange
    final sufIcon = 'packages/widget_library/assets/images/bubble_good.svg';
    testWidget = MaterialApp(
      home: Scaffold(
        body: SearchBarWidget(
          attributes: SearchBarAttributes(
            appearance: SearchBarAppearance(
              suffixIcon: sufIcon,
            ),
          ),
          onSearch: (value) {},
          onTextChanged: (value) {
            print('Listening $value');
          },
        ),
      ),
    );
    final errorFinder = find.byKey(Key('SearchBarWidget_IconButton'));
    // Act
    await tester.pumpWidget(testWidget);
    await tester.tap(errorFinder);
    // Assert
    expect(errorFinder, findsOneWidget);
  });

  testWidgets('checking all the widgets are there in the widget tree',
      (WidgetTester tester) async {
    //Arrange
    final containerFinder = find.byKey(Key('SearchBarWidget_Container'));
    final textFieldFinder = find.byKey(Key('SearchBarWidget_TextField'));
    //Act
    await tester.pumpWidget(testWidget);
    //Arrange
    expect(containerFinder, findsOneWidget);
    expect(textFieldFinder, findsOneWidget);
  });

  testWidgets('finding the icon for the widget', (tester) async {
    // Act
    await tester.pumpWidget(testWidget);
    // Assert
    expect(iconFinder, findsOneWidget);
  });

  testWidgets('should not find the search icon', (tester) async {
    // Arrange
    testWidget = MaterialApp(
      home: Scaffold(
        body: SearchBarWidget(
          onSearch: (value) {},
          onTextChanged: (value) {
            print('Listening $value');
          },
        ),
      ),
    );
    // Act
    await tester.pumpWidget(testWidget);
    // Assert
    expect(iconFinder, findsNothing);
  });
}
