import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:core/utils/extensions/string_extensions.dart';
import 'package:core/utils/extensions/list_extensions.dart';
import 'package:widget_library/static_text/crayon_payment_text.dart';
import 'package:widget_library/theme/crayon_payment_theme.dart';
import 'package:widget_library/utils/icon_utils.dart';

import 'page_header_text_under_icon_widget_attributes.dart';

/// This src allows you to build header with or without icon.
/// It enables highlighting any part of the text. To do that pass [CrayonPaymentPageHeaderTextUnderIconWidgetElementAttributes.highlightedTexts] argument containing text to highlight.
/// Notice that [CrayonPaymentPageHeaderTextUnderIconWidgetElementAttributes.title] must contain full title including highlighted parts.
class CrayonPaymentPageHeaderTextUnderIconWidget extends StatelessWidget {
  final CrayonPaymentPageHeaderTextUnderIconWidgetAttributes attributes;
  final MainAxisAlignment mainAxisAlignment;

  const CrayonPaymentPageHeaderTextUnderIconWidget({
    Key? key,
    required this.attributes,
    this.mainAxisAlignment = MainAxisAlignment.spaceBetween,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      key: Key('CrayonPaymentPageHeaderTextUnderIconWidget_Container'),
      width: double.infinity,
      color: Colors.transparent,
      padding: EdgeInsets.only(
        left: attributes.leftMargin,
        right: attributes.rightMargin,
      ),
      child: Column(
        crossAxisAlignment: attributes.crossAxisAlignment,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: bodyWidgetsList(context),
      ),
    );
  }

  List<Widget> bodyWidgetsList(BuildContext context) {
    final widgetsList = <Widget>[];

    widgetsList.add(
      SizedBox(
        key: Key('CrayonPaymentPageHeaderTextUnderIconWidget_bodyWidgetsList_SizedBox'),
        height: attributes.headerTopPadding,
      ),
    );

    for (var attr in attributes.attributesList) {
      TextStyle? textStyle;
      if (attr.title != null) {
        textStyle = buildTextStyle(
          context: context,
          variant: attr.title?.styleVariant ?? CrayonPaymentTextStyleVariant.headline2,
        );
      }

      if (attr.format ==
          CrayonPaymentPageHeaderTextUnderIconWidgetElementFormat.horizontal) {
        final rowItems = <Widget>[];

        if (attr.title != null) {
          rowItems.add(
            Flexible(
              child: Padding(
                padding: attr.padding?.toEdgeInsets() ?? EdgeInsets.zero,
                child: RichText(
                  textAlign: attr.title?.textAlign ?? TextAlign.start,
                  text: TextSpan(
                    children: _buildHighlighters(
                      context,
                      attr,
                      textStyle!,
                    ),
                  ),
                ),
              ),
            ),
          );
        }

        if (attr.icon != null) {
          rowItems.add(
            Padding(
              key: Key(
                'CrayonPaymentPageHeaderTextUnderIconWidget_bodyWidgetsList_Padding',
              ),
              padding: EdgeInsets.only(left: attr.padding?.left ?? 0),
              child: getIcon(
                context,
                attr,
              ),
            ),
          );
        }

        widgetsList.add(
          Row(
            mainAxisAlignment: mainAxisAlignment,
            children: rowItems,
          ),
        );
      } else {
        if (attr.icon != null) {
          widgetsList.add(
            Padding(
              key: Key(
                'CrayonPaymentPageHeaderTextUnderIconWidget_bodyWidgetsList_LeftPadding',
              ),
              padding: EdgeInsets.only(left: attr.padding?.left ?? 8),
              child: getIcon(
                context,
                attr,
              ),
            ),
          );
          widgetsList.add(
            SizedBox(
              key:
                  Key('CrayonPaymentPageHeaderTextUnderIconWidget_AfterPaddingSizedBox'),
              height: (attr.padding != null) ? attr.padding!.bottom : 31,
            ),
          );
        }
        if (attr.title != null) {
          final text = Padding(
            padding: attr.padding?.toEdgeInsets() ?? EdgeInsets.zero,
            child: RichText(
              text: TextSpan(
                children: _buildHighlighters(
                  context,
                  attr,
                  textStyle!,
                ),
              ),
            ),
          );
          widgetsList.add(text);
        }
      }
    }

    widgetsList.add(
      SizedBox(
        key: Key('CrayonPaymentPageHeaderTextUnderIconWidget_AfterSizedBox'),
        height: attributes.headerBottomPadding,
      ),
    );

    return widgetsList;
  }

  Widget getIcon(
    BuildContext context,
    CrayonPaymentPageHeaderTextUnderIconWidgetElementAttributes attr,
  ) {
    final Widget child;

    if (attr.icon!.contains('.png')) {
      child = getPNG(
        context,
        attr,
      );
    } else {
      child = getSvg(
        attr.icon!,
        color: attr.iconColor ?? Theme.of(context).iconTheme.color,
        height: attr.iconHeight ?? attr.padding?.height ?? 67,
      );
    }

    if (attr.cornerRadius != null) {
      return ClipRRect(
        key: Key('CrayonPaymentPageHeaderTextUnderIconWidget_getIconClipRRect'),
        borderRadius: BorderRadius.all(
          Radius.circular(attr.cornerRadius!),
        ),
        child: child,
      );
    }

    return child;
  }

  Widget getPNG(
    BuildContext context,
    CrayonPaymentPageHeaderTextUnderIconWidgetElementAttributes attr,
  ) {
    return getPng(
      attr.icon!,
      color: attr.iconColor ?? Theme.of(context).iconTheme.color,
      width: (attr.padding != null) ? attr.padding!.width : 0,
      height: (attr.padding != null) ? attr.padding!.height : 67,
    );
  }

  List<TextSpan> _buildHighlighters(
    BuildContext context,
    CrayonPaymentPageHeaderTextUnderIconWidgetElementAttributes attr,
    TextStyle textStyle,
  ) {
    List<TextSpan>? textSpans = [];
    final newTextStyle = textStyle.copyWith(
      color: attr.highlighterTextColor ??
          CrayonPaymentTheme().defaultThemeData.highlightTextColor.toColor(),
      fontFamily: 'AktivGrotesqueMd',
    );

    var originalText = attr.title?.text ?? '';

    if (attr.highlightedTexts.isNullOrEmpty()) {
      textSpans.add(
        TextSpan(
          text: originalText.tr,
          style: textStyle,
        ),
      );
    } else {
      final highlighterTextSpans = attr.highlightedTexts!
          .map((highlightedText) {
            if (highlightedText.isNullOrEmpty()) {
              return [TextSpan(text: '')];
            } else {
              final splitTextSpans = <TextSpan>[];
              final splitTexts = originalText.split(highlightedText);

              if (splitTexts.length > 1) {
                splitTextSpans.add(
                  TextSpan(
                    text: splitTexts.first.tr,
                    style: textStyle,
                  ),
                );

                splitTextSpans.add(
                  TextSpan(
                    text: highlightedText.tr,
                    style: newTextStyle,
                  ),
                );

                splitTexts.removeAt(0);
              }
              originalText = splitTexts.last;

              return splitTextSpans;
            }
          })
          .toList()
          .expand((element) => element)
          .toList();

      highlighterTextSpans.add(
        TextSpan(
          text: originalText.tr,
          style: textStyle,
        ),
      );
      textSpans.addAll(highlighterTextSpans);
    }

    return textSpans;
  }
}
