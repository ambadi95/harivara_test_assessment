import 'package:flutter/material.dart';
import 'package:widget_library/colors/crayon_payment_colors.dart';
import 'package:widget_library/list_tile_circle_icon/highlightable_search/field_to_highlight.dart';

import '../crayon_payment_list_tile.dart';

class SearchHighlightedListTile extends StatelessWidget {
  static const String _identifier = 'SearchHighlightedListTile';
  static const String _subtitleIdentifier = 'Subtitle';
  static const String _titleIndetifier = 'Title';
  final Widget? displayIcon;
  final Function()? onTapCallback;
  final String? subtitle;
  final String title;
  final String? searchTerm;
  final FieldToHighlight fieldToHighlight;

  const SearchHighlightedListTile({
    Key? key,
    required this.title,
    this.subtitle,
    this.displayIcon,
    this.onTapCallback,
    this.searchTerm,
    required this.fieldToHighlight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CrayonPaymentListTile(
      _buildTitle(title, CrayonPaymentColors.crayonPaymentBlack),
      _buildSubtitle(subtitle ?? '', CrayonPaymentColors.crayonPaymentDarkGray),
      trailWidget: Icon(
        Icons.arrow_forward_ios_rounded,
        color: CrayonPaymentColors.crayonPaymentGold,
        size: 16,
      ),
      onTapCallbackListTile: onTapCallback,
      displayIcon: displayIcon,
      key: Key('$_identifier'),
    );
  }

  Widget _buildTitle(String text, Color colorOfNotHighlightedText) {
    final selectedText = fieldToHighlight.when(
      title: () => title,
      subtitle: () => subtitle ?? '',
    );

    if (text == selectedText) {
      final lowercaseText = selectedText.toLowerCase();

      if (searchTerm != null &&
          lowercaseText.contains(searchTerm!.toLowerCase())) {
        return _buildHighlightableTitle(
          selectedText,
          colorOfNotHighlightedText,
        );
      } else {
        return _buildStandardText(
          selectedText,
          colorOfNotHighlightedText,
          _titleIndetifier,
        );
      }
    } else {
      return _buildStandardText(
        text,
        colorOfNotHighlightedText,
        _titleIndetifier,
      );
    }
  }

  Widget _buildSubtitle(String text, Color colorOfNotHighlightedText) {
    int? higlightLength;

    final selectedText = fieldToHighlight.when(
      title: () => title,
      subtitle: () => subtitle ?? '',
    );

    if (text == selectedText) {
      if (searchTerm != null) {
        higlightLength = _getLengthOfHighlight(selectedText);
      }

      if (higlightLength != null) {
        return _buildHighlightableSubtitle(
          selectedText,
          colorOfNotHighlightedText,
          higlightLength,
        );
      } else {
        return _buildStandardText(
          selectedText,
          colorOfNotHighlightedText,
          _subtitleIdentifier,
        );
      }
    } else {
      return _buildStandardText(
        text,
        colorOfNotHighlightedText,
        _subtitleIdentifier,
      );
    }
  }

  RichText _buildStandardText(
    String selectedText,
    Color colorOfNotHighlightedText,
    String key,
  ) {
    return _buildRichText(
      TextSpan(
        text: selectedText,
        style: _titleTextStyle(colorOfNotHighlightedText),
      ),
      Key('${_identifier}_${key}_StandardText'),
    );
  }

  RichText _buildHighlightableTitle(
    String text,
    Color colorOfNotHighlightedText,
  ) {
    final textToHighlight = text.toLowerCase();
    final indexOfSearchTerm =
        textToHighlight.indexOf(searchTerm!.toLowerCase());
    final lengthOfSearchTerm = searchTerm!.length;
    final endIndex = indexOfSearchTerm + lengthOfSearchTerm;

    final textSpan = TextSpan(
      text: text.substring(0, indexOfSearchTerm),
      style: _titleTextStyle(colorOfNotHighlightedText),
      children: [
        TextSpan(
          text: text.substring(indexOfSearchTerm, endIndex),
          style: _titleTextStyle(CrayonPaymentColors.crayonPaymentGold),
        ),
        TextSpan(
          text: text.substring(endIndex, textToHighlight.length),
          style: _titleTextStyle(colorOfNotHighlightedText),
        )
      ],
    );
    return _buildRichText(textSpan, Key('${_identifier}_HighlightableTitle'));
  }

  RichText _buildRichText(TextSpan textSpan, Key key) {
    return RichText(
      overflow: TextOverflow.ellipsis,
      maxLines: 1,
      key: key,
      text: textSpan,
    );
  }

  RichText _buildHighlightableSubtitle(
    String text,
    Color colorOfNotHighlightedText,
    int higlightLength,
  ) {
    return RichText(
      key: Key('${_identifier}_HighlightableSubtitle'),
      text: TextSpan(
        text: text.substring(0, higlightLength),
        style: _titleTextStyle(CrayonPaymentColors.crayonPaymentGold),
        children: [
          TextSpan(
            text: text.substring(higlightLength, text.length),
            style: _titleTextStyle(colorOfNotHighlightedText),
          ),
        ],
      ),
    );
  }

  TextStyle _titleTextStyle(Color color) {
    return TextStyle(
      color: color,
      fontWeight: FontWeight.w500,
    );
  }

  int? _getLengthOfHighlight(String selectedText) {
    /// Match text is the input from the search bar
    final String matchText = searchTerm!.replaceAll('+', '');

    /// idx is the position until which we should highlight in case of a match
    int idx = 0;

    /// isMatch used to break if there is no match
    bool isMatch = false;

    /// selectedText is the actual number from the list
    if (selectedText.isNotEmpty) {
      /// We are looping through each character of the input field and trying to
      /// see if there is a match with the number from the list.
      for (var i = 0; i < matchText.length; i++) {
        var char = matchText[i];

        if (idx < selectedText.length) {
          /// Discards each special character and increment the index until
          /// we reach a number
          while (num.tryParse(selectedText[idx]) == null) {
            idx++;
          }

          /// First number that doesn't match the pattern breaks the loop
          isMatch = selectedText[idx] == char ? true : false;
        }

        if (!isMatch) {
          break;
        }
        idx++;
      }
    }
    return isMatch ? idx : null;
  }
}
