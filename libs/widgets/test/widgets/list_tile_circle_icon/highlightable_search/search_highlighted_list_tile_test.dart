import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:widget_library/list_tile_circle_icon/highlightable_search/field_to_highlight.dart';
import 'package:widget_library/list_tile_circle_icon/highlightable_search/search_highlighted_list_tile.dart';

int counter = 0;

void main() {
  late Widget testWidget;
  const String _identifier = 'SearchHighlightedListTile';
  const String _title = 'John Doe';
  const String _subtitle = '(955) 435-123-426';

  group('test for checking highlighted title', () {
    setUp(() {
      testWidget = MaterialApp(
        home: Scaffold(
          body: SearchHighlightedListTile(
            title: _title,
            subtitle: _subtitle,
            fieldToHighlight: FieldToHighlight.title(),
            searchTerm: 'John',
            onTapCallback: _callbackOnTap,
          ),
        ),
      );
    });

    testWidgets('[SearchHighlightedListTile] - all widgets available',
        (tester) async {
      // Arrange
      final titleFinder = find.byKey(Key('${_identifier}_HighlightableTitle'));
      final subtitleFinder =
          find.byKey(Key('${_identifier}_Subtitle_StandardText'));
      // Act
      await tester.pumpWidget(testWidget);
      // Assert
      expect(titleFinder, findsOneWidget);
      expect(subtitleFinder, findsOneWidget);
    });
  });

  group('test for checking highlighted subtitle', () {
    setUp(() {
      testWidget = MaterialApp(
        home: Scaffold(
          body: SearchHighlightedListTile(
            title: _title,
            subtitle: _subtitle,
            fieldToHighlight: FieldToHighlight.subtitle(),
            searchTerm: '955',
            onTapCallback: _callbackOnTap,
          ),
        ),
      );
    });

    testWidgets(
        '[SearchHighlightedListTile] - all widgets available and '
        'checking the highlighted subtitle', (tester) async {
      // Arrange
      final titleFinder2 = find.byKey(Key('${_identifier}_Title_StandardText'));
      final subtitleFinder2 =
          find.byKey(Key('${_identifier}_HighlightableSubtitle'));
      // Act
      await tester.pumpWidget(testWidget);
      // Assert
      expect(titleFinder2, findsOneWidget);
      expect(subtitleFinder2, findsOneWidget);
    });
  });

  group('testing with any value which is not found', () {
    setUp(() {
      testWidget = MaterialApp(
        home: Scaffold(
          body: SearchHighlightedListTile(
            title: _title,
            subtitle: _subtitle,
            fieldToHighlight: FieldToHighlight.subtitle(),
            searchTerm: 'asdasd',
            onTapCallback: _callbackOnTap,
          ),
        ),
      );
    });

    testWidgets(
        '[SearchHighlightedListTile] - all widgets available and '
        'checking for any value', (tester) async {
      // Arrange
      final textFinder = find.byKey(Key('${_identifier}_Title_StandardText'));
      // Act
      await tester.pumpWidget(testWidget);
      // Assert
      expect(textFinder, findsOneWidget);
    });
  });

  testWidgets('[SearchHighlightedListTile] - onTap', (tester) async {
    // Arrange
    final widget = find.byKey(Key('${_identifier}'));
    // Act
    await tester.pumpWidget(testWidget);
    await tester.tap(widget);
    // Assert
    expect(counter, 1);
  });
}

void _callbackOnTap() {
  counter++;
}
