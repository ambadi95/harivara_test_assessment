import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:widget_library/search_bar/search_bar_for_mobile_number.dart';

void main() {
  late Widget testWidget;

  setUp(() {
    testWidget = MaterialApp(
      home: Scaffold(
        body: SearchBarForMobileNumber(
          onTextChanged: (value) {},
        ),
      ),
    );
  });

  testWidgets('should have all required widgets', (tester) async {
    // Arrange
    final searchBarFinder = find.byKey(const Key('search-bar-for-mobile'));
    final countryListPickFinder = find.byKey(const Key('country_List_Pick'));
    // Act
    await tester.pumpWidget(testWidget);
    // Assert
    expect(searchBarFinder, findsOneWidget);
    expect(countryListPickFinder, findsOneWidget);
  });

  testWidgets('search with the mobile number ', (tester) async {
    // Arrange
    final textFieldFinder = find.byKey(Key('SearchBarWidget_TextField'));
    // Act
    await tester.pumpWidget(testWidget);
    await tester.enterText(textFieldFinder, 'Value');
    await tester.pump(Duration(milliseconds: 500));
    // Assert
  });
}
