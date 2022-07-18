import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:widget_library/horizontal_scroll_container/horizontal_scroll_container.dart';

void main() {
  late Widget testWidget;
  setUp(() {
    testWidget = MaterialApp(
      home: HorizontalScroll<String>(
        elements: [
          HorizontalScrollItem<String>(item: 'All', uiString: 'All'),
          HorizontalScrollItem<String>(item: 'In', uiString: 'In'),
        ],
      ),
    );
  });
  testWidgets('displaying list of items on horizontal axis', (tester) async {
    // Arrange
    final horizontalScrollFinder = find.byKey(const Key('HorizontalScroll'));
    final containerFinder = find.byKey(const Key('selected-container-1'));
    // Act
    await tester.pumpWidget(testWidget);
    // Arrange
    expect(horizontalScrollFinder, findsOneWidget);
    expect(containerFinder, findsOneWidget);
  });
}
