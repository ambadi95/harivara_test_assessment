import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:widget_library/app_bars/crayon_payment_app_bar_attributes.dart';
import 'package:widget_library/app_bars/crayon_payment_app_bar_button_type.dart';
import 'package:widget_library/scaffold/crayon_payment_scaffold.dart';
import 'package:widget_library/theme/crayon_payment_theme.dart';

void main() {
  late Widget testWidget;

  setUpAll(() {
    CrayonPaymentTheme().initialize(loadCustomTheme: false);
  });

  setUp(() {
    testWidget = MaterialApp(
      theme: CrayonPaymentTheme().defaultTheme,
      home: CrayonPaymentScaffold(
        appBarAttributes: _buildAppBar,
        body: Container(),
      ),
    );
  });

  testWidgets('[CrayonPaymentAppBar] - check existence of all components',
      (WidgetTester tester) async {
    String _identifier = 'CrayonPaymentAppBar';

    await tester.pumpWidget(testWidget);

    final leadingRowFinder = find.byKey(Key('${_identifier}_Row'));
    final leftButtonFinder =
        find.byKey(Key('${_identifier}_GestureDetector0_false'));
    final rightButtonFinder =
        find.byKey(Key('${_identifier}_GestureDetector0_true'));
    final titleFinder = find.byKey(Key('${_identifier}_Title'));

    expect(leadingRowFinder, findsOneWidget);
    expect(leftButtonFinder, findsOneWidget);
    expect(rightButtonFinder, findsOneWidget);
    expect(titleFinder, findsOneWidget);
  });
}

CrayonPaymentAppBarAttributes get _buildAppBar {
  return CrayonPaymentAppBarAttributes(
    title: 'Test',
    left: [
      CrayonPaymentAppBarButtonType.back(),
    ],
    right: [
      CrayonPaymentAppBarButtonType.close(),
    ],
  );
}
