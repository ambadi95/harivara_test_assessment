import 'package:flutter/material.dart';
import 'package:widget_library/padding.dart';
import 'package:widget_library/page_header/text_ui_data_model.dart';

enum CrayonPaymentPageHeaderTextUnderIconWidgetTextElementType {
  header,
  subHeader,
  date,
}

enum CrayonPaymentPageHeaderTextUnderIconPosition {
  top,
  left,
  right,
}

enum CrayonPaymentPageHeaderTextUnderIconWidgetElementFormat {
  vertical,
  horizontal,
}

class CrayonPaymentPageHeaderTextUnderIconWidgetElementAttributes {
  final String? icon;
  final Color? iconColor;
  final double? cornerRadius;
  final double? iconBottomMargins;
  final double? iconHeight;
  TextUIDataModel? title;
  final List<String>? highlightedTexts;
  final Color? highlighterTextColor;
  final Function()? onPressed;
  final CrayonPaymentPadding? padding;
  final CrayonPaymentPageHeaderTextUnderIconWidgetTextElementType type;
  final CrayonPaymentPageHeaderTextUnderIconWidgetElementFormat format;
  final CrayonPaymentPageHeaderTextUnderIconPosition position;

  CrayonPaymentPageHeaderTextUnderIconWidgetElementAttributes({
    this.icon,
    this.iconHeight,
    this.iconBottomMargins,
    this.iconColor,
    this.cornerRadius,
    this.title,
    this.highlightedTexts,
    this.highlighterTextColor,
    this.padding,
    this.onPressed,
    this.position = CrayonPaymentPageHeaderTextUnderIconPosition.top,
    this.type =
        CrayonPaymentPageHeaderTextUnderIconWidgetTextElementType.header,
    this.format =
        CrayonPaymentPageHeaderTextUnderIconWidgetElementFormat.vertical,
  });

  CrayonPaymentPageHeaderTextUnderIconWidgetElementAttributes copyWith({
    final String? icon,
    final Color? iconColor,
    final double? cornerRadius,
    final TextUIDataModel? title,
    final List<String>? highlightedTexts,
    final Color? highlighterTextColor,
    final Function()? onPressed,
    final CrayonPaymentPadding? padding,
    final CrayonPaymentPageHeaderTextUnderIconWidgetTextElementType? type,
    final CrayonPaymentPageHeaderTextUnderIconWidgetElementFormat? format,
  }) =>
      CrayonPaymentPageHeaderTextUnderIconWidgetElementAttributes(
        icon: icon ?? this.icon,
        iconColor: iconColor ?? this.iconColor,
        cornerRadius: cornerRadius ?? this.cornerRadius,
        title: title ?? this.title,
        highlightedTexts: highlightedTexts ?? this.highlightedTexts,
        highlighterTextColor: highlighterTextColor ?? this.highlighterTextColor,
        onPressed: onPressed ?? this.onPressed,
        padding: padding ?? this.padding,
        type: type ?? this.type,
        format: format ?? this.format,
      );
}

class CrayonPaymentPageHeaderTextUnderIconWidgetAttributes {
  final List<CrayonPaymentPageHeaderTextUnderIconWidgetElementAttributes>
      attributesList;
  final double headerTopPadding;
  final double leftMargin;
  final double rightMargin;
  final double headerBottomPadding;
  final CrossAxisAlignment crossAxisAlignment;

  CrayonPaymentPageHeaderTextUnderIconWidgetAttributes({
    required this.attributesList,
    this.headerTopPadding = 67,
    this.headerBottomPadding = 13,
    this.leftMargin = 32,
    this.rightMargin = 0,
    this.crossAxisAlignment = CrossAxisAlignment.start,
  });

  CrayonPaymentPageHeaderTextUnderIconWidgetAttributes copyWith({
    final List<CrayonPaymentPageHeaderTextUnderIconWidgetElementAttributes>?
        attributesList,
    final double? headerTopPadding,
    final double? leftMargin,
    final double? rightMargin,
    final double? headerBottomPadding,
    final CrossAxisAlignment? crossAxisAlignment,
  }) =>
      CrayonPaymentPageHeaderTextUnderIconWidgetAttributes(
        attributesList: attributesList ?? this.attributesList,
        headerBottomPadding: headerBottomPadding ?? this.headerBottomPadding,
        headerTopPadding: headerTopPadding ?? this.headerTopPadding,
        leftMargin: leftMargin ?? this.leftMargin,
        rightMargin: rightMargin ?? this.rightMargin,
        crossAxisAlignment: crossAxisAlignment ?? this.crossAxisAlignment,
      );
}
