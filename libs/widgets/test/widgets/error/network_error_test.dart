import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:widget_library/error/network_error.dart';
import 'package:widget_library/theme/crayon_payment_theme.dart';

void main() {
  late Widget testWidget;

  setUp(() {
    CrayonPaymentTheme().initialize(loadCustomTheme: false);
    testWidget = const MaterialApp(
      home: Scaffold(body: NetworkErrorScreen()),
    );
  });
  testWidgets('CrayonPaymentNetworkErrorScreen WidgetTest', (WidgetTester tester) async {
    final networkErrorScreenViewFinder =
    find.byKey(const Key('NetworkErrorScreen'));
    final networkScreenImageFinder =
    find.byKey(const Key('NetworkErrorScreen_Image'));
    final networkScreenAppbarFinder =
    find.byKey(const Key('NetworkErrorScreen_BackButton'));
    final networkScreenTitleFinder =
    find.byKey(const Key('NetworkErrorScreen_Title'));
    final networkScreenSubtitleFinder =
    find.byKey(const Key('NetworkErrorScreen_SubtiTitle'));
    await tester.pumpWidget(testWidget);

    expect(networkErrorScreenViewFinder, findsOneWidget);
    expect(networkScreenImageFinder, findsOneWidget);
    expect(networkScreenAppbarFinder, findsOneWidget);
    expect(networkScreenTitleFinder, findsOneWidget);
    expect(networkScreenSubtitleFinder, findsOneWidget);
  });
}
