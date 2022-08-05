import 'package:core/retrievers/app_info_retriever.dart';
import 'package:core/retrievers/data_models/app_type.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:mocktail/mocktail.dart';
import 'package:widget_library/expandable_details/data_model/expandable_details_options.dart';
import 'package:widget_library/expandable_details/expandable_details.dart';
import 'package:widget_library/expandable_details/widgets/expand_details_bottom_row.dart';
import 'package:widget_library/expandable_details/widgets/expand_details_divider.dart';
import 'package:widget_library/expandable_details/widgets/expand_details_info_line.dart';

class MockAppRetriever extends Mock implements AppInfoRetriever {}

void main() {
  late Widget testWidget;
  late ExpandDetailsBottomRow bottomRow;
  late List<ExpandableDetailsOptions> options;
  late MockAppRetriever appRetriever;

  final keyExpandedInfoLine = const Key('expandedInfoLine');
  final keyExpandedDivider = const Key('expandedDivider');

  setUp(() {
    appRetriever = MockAppRetriever();
    when(() => appRetriever.appType).thenReturn(AppType.customer());
    bottomRow = ExpandDetailsBottomRow(
      leftSide: 'leftSide',
      rightSide: Text('rightSide'),
    );
    options = [
      ExpandDetailsInfoLine(
        leftSideString: 'leftSide',
        rightSideWidget: Text('rightSide'),
      ),
      ExpandDetailsDivider(key: keyExpandedDivider),
      ExpandDetailsInfoLine(
        leftSideString: 'leftSide',
        rightSideWidget: Text('rightSide'),
        key: keyExpandedInfoLine,
      ),
    ];

    testWidget = MaterialApp(
      home: Scaffold(
        body: ExpandableDetails(
          expandDetailsBottomRow: [bottomRow],
          itemsWhenExpanded: options,
          topTitleText: 'title',
        ),
      ),
    );
  });

  final gestureDetectorFinder = find.byKey(const Key('gesture_detector'));
  final expandedInfoFinder = find.byKey(keyExpandedInfoLine);
  final expandedDividerFinder = find.byKey(keyExpandedDivider);

  testWidgets('should show required widgets', (tester) async {
    // Arrange
    final titleTextFinder = find.byKey(const Key('title_text'));
    final arrowIconFinder = find.byKey(const Key('arrow_icon'));
    // Act
    await tester.pumpWidget(testWidget);
    // Assert
    expect(gestureDetectorFinder, findsOneWidget);
    expect(titleTextFinder, findsOneWidget);
    expect(arrowIconFinder, findsOneWidget);
  });

  testWidgets('should not show expanded widgets without tapping',
      (tester) async {
    // Act
    await tester.pumpWidget(testWidget);
    // Assert
    expect(expandedInfoFinder, findsNothing);
    expect(expandedDividerFinder, findsNothing);
  });

  testWidgets('should show expanded widgets when tapped', (tester) async {
    // Act
    await tester.pumpWidget(testWidget);
    await tester.tap(gestureDetectorFinder);
    await tester.pump();

    // Assert
    expect(expandedInfoFinder, findsOneWidget);
    expect(expandedDividerFinder, findsOneWidget);
  });
}
