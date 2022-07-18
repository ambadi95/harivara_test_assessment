import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:widget_library/bottom_navigation/bottom_navigation_items.dart';

void main() {
  testWidgets('BottomNavigationItems - test number of buttons', (tester) async {
    const int _noButtonsExpected = 3;
    List<BottomNavigationBarItem> listOfItems = buildBottomNavigationItems();

    var sizeOfList = listOfItems.length;

    expect(sizeOfList, _noButtonsExpected);
  });
}
