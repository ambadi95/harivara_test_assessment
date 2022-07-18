import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:widget_library/app_bars/crayon_payment_app_bar_attributes.dart';
import 'package:widget_library/app_bars/crayon_payment_app_bar_button_type.dart';
import 'package:widget_library/scaffold/crayon_payment_scaffold.dart';
import 'package:widget_library/theme/crayon_payment_theme.dart';

int _functionCallCounter = 0;

void _testFunction() {
  _functionCallCounter++;
}

void main() {
  late Widget testWidget;
  String _identifier = 'CrayonPaymentAppBarButtons';

  setUpAll(() {
    CrayonPaymentTheme().initialize(loadCustomTheme: false);
  });

  group('[CrayonPaymentAppBarButtonType] - back button', () {
    setUp(() {
      testWidget = MaterialApp(
        theme: CrayonPaymentTheme().defaultTheme,
        home: CrayonPaymentScaffold(
          appBarAttributes: CrayonPaymentAppBarAttributes(
            left: [
              CrayonPaymentAppBarButtonType.back(
                onPressed: _testFunction,
              ),
            ],
          ),
          body: Container(),
        ),
      );
    });
    testWidgets('[CrayonPaymentAppBarButtonType] - check existence of all components',
        (WidgetTester tester) async {
      await tester.pumpWidget(testWidget);

      final buttonFinder = find.byKey(Key('${_identifier}_BackArrow'));
      final iconFinder = find.byIcon(Icons.arrow_back);

      await tester.tap(iconFinder);

      expect(buttonFinder, findsOneWidget);
      expect(iconFinder, findsOneWidget);
      expect(_functionCallCounter, 1);
    });

    tearDown(() {
      _functionCallCounter = 0;
    });
  });

  group('[CrayonPaymentAppBarButtonType] - menu button', () {
    setUp(() {
      testWidget = MaterialApp(
        theme: CrayonPaymentTheme().defaultTheme,
        home: CrayonPaymentScaffold(
          appBarAttributes: CrayonPaymentAppBarAttributes(
            left: [
              CrayonPaymentAppBarButtonType.menu(
                onPressed: _testFunction,
              ),
            ],
          ),
          body: Container(),
        ),
      );
    });

    testWidgets('[CrayonPaymentAppBarButtonType] - check existence of all components',
        (WidgetTester tester) async {
      await tester.pumpWidget(testWidget);

      final buttonFinder = find.byKey(Key('${_identifier}_MenuIcon'));
      final iconFinder = find.byIcon(Icons.menu);

      await tester.tap(iconFinder);

      expect(buttonFinder, findsOneWidget);
      expect(iconFinder, findsOneWidget);
      expect(_functionCallCounter, 1);
    });

    tearDown(() {
      _functionCallCounter = 0;
    });
  });

  group('[CrayonPaymentAppBarButtonType] - search button', () {
    setUp(() {
      testWidget = MaterialApp(
        theme: CrayonPaymentTheme().defaultTheme,
        home: CrayonPaymentScaffold(
          appBarAttributes: CrayonPaymentAppBarAttributes(
            left: [
              CrayonPaymentAppBarButtonType.search(
                onPressed: _testFunction,
              ),
            ],
          ),
          body: Container(),
        ),
      );
    });

    testWidgets('[CrayonPaymentAppBarButtonType] - check existence of all components',
        (WidgetTester tester) async {
      await tester.pumpWidget(testWidget);

      final buttonFinder = find.byKey(Key('${_identifier}_SearchIcon'));
      final iconFinder = find.byIcon(Icons.search);

      await tester.tap(iconFinder);

      expect(buttonFinder, findsOneWidget);
      expect(iconFinder, findsOneWidget);
      expect(_functionCallCounter, 1);
    });

    tearDown(() {
      _functionCallCounter = 0;
    });
  });

  group('[CrayonPaymentAppBarButtonType] - close button', () {
    setUp(() {
      testWidget = MaterialApp(
        theme: CrayonPaymentTheme().defaultTheme,
        home: CrayonPaymentScaffold(
          appBarAttributes: CrayonPaymentAppBarAttributes(
            left: [
              CrayonPaymentAppBarButtonType.close(
                onPressed: _testFunction,
              ),
            ],
          ),
          body: Container(),
        ),
      );
    });

    testWidgets('[CrayonPaymentAppBarButtonType] - check existence of all components',
        (WidgetTester tester) async {
      await tester.pumpWidget(testWidget);

      final buttonFinder = find.byKey(Key('${_identifier}_CloseIcon'));
      final iconFinder = find.byIcon(Icons.close);

      await tester.tap(iconFinder);

      expect(buttonFinder, findsOneWidget);
      expect(iconFinder, findsOneWidget);
      expect(_functionCallCounter, 1);
    });

    tearDown(() {
      _functionCallCounter = 0;
    });
  });

  group('[CrayonPaymentAppBarButtonType] - more button', () {
    setUp(() {
      testWidget = MaterialApp(
        theme: CrayonPaymentTheme().defaultTheme,
        home: CrayonPaymentScaffold(
          appBarAttributes: CrayonPaymentAppBarAttributes(
            left: [
              CrayonPaymentAppBarButtonType.more(
                onPressed: _testFunction,
              ),
            ],
          ),
          body: Container(),
        ),
      );
    });

    testWidgets('[CrayonPaymentAppBarButtonType] - check existence of all components',
        (WidgetTester tester) async {
      await tester.pumpWidget(testWidget);

      final buttonFinder = find.byKey(Key('${_identifier}_MoreIcon'));
      final iconFinder = find.byIcon(Icons.more_horiz_sharp);

      await tester.tap(iconFinder);

      expect(buttonFinder, findsOneWidget);
      expect(iconFinder, findsOneWidget);
      expect(_functionCallCounter, 1);
    });

    tearDown(() {
      _functionCallCounter = 0;
    });
  });

  group('[CrayonPaymentAppBarButtonType] - share button', () {
    setUp(() {
      testWidget = MaterialApp(
        theme: CrayonPaymentTheme().defaultTheme,
        home: CrayonPaymentScaffold(
          appBarAttributes: CrayonPaymentAppBarAttributes(
            left: [
              CrayonPaymentAppBarButtonType.share(
                onPressed: _testFunction,
              ),
            ],
          ),
          body: Container(),
        ),
      );
    });

    testWidgets('[CrayonPaymentAppBarButtonType] - check existence of all components',
        (WidgetTester tester) async {
      await tester.pumpWidget(testWidget);

      final buttonFinder = find.byKey(Key('${_identifier}_ShareIcon'));
      final iconFinder = find.byIcon(Icons.ios_share);

      await tester.tap(iconFinder);

      expect(buttonFinder, findsOneWidget);
      expect(iconFinder, findsOneWidget);
      expect(_functionCallCounter, 1);
    });

    tearDown(() {
      _functionCallCounter = 0;
    });
  });

  group('[CrayonPaymentAppBarButtonType] - skip button', () {
    setUp(() {
      testWidget = MaterialApp(
        theme: CrayonPaymentTheme().defaultTheme,
        home: CrayonPaymentScaffold(
          appBarAttributes: CrayonPaymentAppBarAttributes(
            left: [
              CrayonPaymentAppBarButtonType.skip(
                onPressed: _testFunction,
              ),
            ],
          ),
          body: Container(),
        ),
      );
    });

    testWidgets('[CrayonPaymentAppBarButtonType] - check existence of all components',
        (WidgetTester tester) async {
      await tester.pumpWidget(testWidget);

      final buttonFinder = find.byKey(Key('${_identifier}_SkipButton'));

      await tester.tap(buttonFinder);

      expect(buttonFinder, findsOneWidget);
      expect(_functionCallCounter, 1);
    });

    tearDown(() {
      _functionCallCounter = 0;
    });
  });

  group('[CrayonPaymentAppBarButtonType] - login button', () {
    setUp(() {
      testWidget = MaterialApp(
        theme: CrayonPaymentTheme().defaultTheme,
        home: CrayonPaymentScaffold(
          appBarAttributes: CrayonPaymentAppBarAttributes(
            left: [
              CrayonPaymentAppBarButtonType.login(
                onPressed: _testFunction,
              ),
            ],
          ),
          body: Container(),
        ),
      );
    });

    testWidgets('[CrayonPaymentAppBarButtonType] - check existence of all components',
        (WidgetTester tester) async {
      await tester.pumpWidget(testWidget);

      final buttonFinder = find.byKey(Key('${_identifier}_LoginButton'));

      await tester.tap(buttonFinder);

      expect(buttonFinder, findsOneWidget);
      expect(_functionCallCounter, 1);
    });

    tearDown(() {
      _functionCallCounter = 0;
    });
  });

  group('[CrayonPaymentAppBarButtonType] - sign up button', () {
    setUp(() {
      testWidget = MaterialApp(
        theme: CrayonPaymentTheme().defaultTheme,
        home: CrayonPaymentScaffold(
          appBarAttributes: CrayonPaymentAppBarAttributes(
            left: [
              CrayonPaymentAppBarButtonType.signup(
                onPressed: _testFunction,
              ),
            ],
          ),
          body: Container(),
        ),
      );
    });

    testWidgets('[CrayonPaymentAppBarButtonType] - check existence of all components',
        (WidgetTester tester) async {
      await tester.pumpWidget(testWidget);

      final buttonFinder = find.byKey(Key('${_identifier}_SignUpButton'));

      await tester.tap(buttonFinder);

      expect(buttonFinder, findsOneWidget);
      expect(_functionCallCounter, 1);
    });

    tearDown(() {
      _functionCallCounter = 0;
    });
  });
}
