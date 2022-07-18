import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:widget_library/list_tile_circle_icon/crayon_payment_list_tile.dart';

void main() {
  late Widget testWidget;

  setUp(() {
    testWidget = MaterialApp(
      home: Scaffold(
        body: CrayonPaymentListTile(
          Text('Title'),
          Text('SubTitle'),
        ),
      ),
    );
  });

  testWidgets('finds the widget', (tester) async {
    // Arrange
    final inkwellFinder = find.byKey(Key('inkwell'));
    final listTileRowFinder = find.byKey(Key('list_tile_row'));
    // Act
    await tester.pumpWidget(testWidget);
    // Assert
    expect(inkwellFinder, findsOneWidget);
    expect(listTileRowFinder, findsOneWidget);
  });
}
