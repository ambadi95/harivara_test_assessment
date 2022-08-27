import 'package:flutter/material.dart';
import 'package:widget_library/app_bars/crayon_payment_app_bar_button_type.dart';
import 'package:widget_library/scaffold/crayon_payment_scaffold.dart';

class CrayonPaymentAppBarAttributes {
  Key? key;
  String? title;
  TextStyle? titleTextStyle;
  List<CrayonPaymentAppBarButtonType>? left;
  List<CrayonPaymentAppBarButtonType>? right;
  Widget? subWidgets;
  CrayonPaymentBrightness brightness;
  double titleOffsetFromTop;
  Color appBarColor;

  CrayonPaymentAppBarAttributes({
    this.key,
    this.title,
    this.titleTextStyle,
    this.left,
    this.right,
    this.subWidgets,
    this.appBarColor = Colors.white,
    this.brightness = CrayonPaymentBrightness.light,
    this.titleOffsetFromTop = 0.0,
  });

  CrayonPaymentAppBarAttributes copyWith({
    String? title,
    TextStyle? titleTextStyle,
    List<CrayonPaymentAppBarButtonType>? left,
    List<CrayonPaymentAppBarButtonType>? right,
    Widget? subWidgets,
  }) =>
      CrayonPaymentAppBarAttributes(
        title: title ?? this.title,
        titleTextStyle: titleTextStyle ?? this.titleTextStyle,
        left: left ?? this.left,
        right: right ?? this.right,
        subWidgets: subWidgets ?? this.subWidgets,
      );
}
