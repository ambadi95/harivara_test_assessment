import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:widget_library/rows/reusable_info_row.dart';
import 'package:dartz/dartz.dart';

void main() {
  testWidgets('ReusableInfoRow WidgetTest', (tester) async {
    const String _identifier = 'ReusableInfoRow';

    final widgetFinder = find.byKey(Key('${_identifier}_Widget'));
    final rowFinder = find.byKey(Key('${_identifier}_Row'));
    final iconFinder = find.byKey(Key('${_identifier}_Icon'));
    final titleFinder = find.byKey(Key('${_identifier}_Title'));
    final subtitleFinder = find.byKey(Key('${_identifier}_Subtitle'));

    var testWidget = MaterialApp(
      home: Scaffold(
        body: Container(
          child: ReusableInfoRow(
            title: 'Test',
            subtitle: 'This is a subtitle',
            icon: Left(Icons.wallet_giftcard),
          ),
        ),
      ),
    );

    await tester.pumpWidget(testWidget);

    expect(widgetFinder, findsOneWidget);
    expect(rowFinder, findsOneWidget);
    expect(iconFinder, findsOneWidget);
    expect(titleFinder, findsOneWidget);
    expect(subtitleFinder, findsOneWidget);
  });
}
