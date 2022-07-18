import 'package:flutter/material.dart';
import 'package:widget_library/app_bars/crayon_payment_app_bar_attributes.dart';
import 'package:widget_library/buttons/docked_button_bar.dart';
import 'package:widget_library/padding.dart';
import 'package:widget_library/page_header/page_header_text_under_icon/page_header_text_under_icon_widget_attributes.dart';
import 'package:widget_library/page_header/text_ui_data_model.dart';
import 'package:widget_library/scaffold/crayon_payment_scaffold.dart';
import 'package:widget_library/utils/icon_utils.dart';

class BottomDecorationAttributes {
  final String image;
  final ImageType type;
  final Color? startColor;
  final Color? endColor;
  BottomDecorationAttributes({
    required this.image,
    required this.type,
    this.startColor,
    this.endColor,
  });
}

/// according to the design, in addition to having them in the bottom bar,
/// the buttons can be anywhere on the screen.
///
class AdditionalButtonAttributes {
  final TextUIDataModel text;
  final String position;
  void Function() onPressed;
  AdditionalButtonAttributes({
    required this.text,
    required this.position,
    required this.onPressed,
  });
}

class SuccessScreenBaseWidgetAttributes {
  final CrayonPaymentAppBarAttributes? appBarAttributes;
  CrayonPaymentDockedButtonBarAttributes? bottomBarAttributes;
  final CrayonPaymentPageHeaderTextUnderIconWidgetAttributes items;
  final TextUIDataModel? message;
  final String? crossIconPath;
  final CrayonPaymentPadding? crossIconPadding;
  final Function()? onCrossIconTap;
  final CrayonPaymentPadding? padding;
  final String theme;
  final String? backgroundImageUri;
  final ImageType? backgroundImageType;
  final Color? headerTextColor;
  final MainAxisAlignment mainAxisAlignment;
  final bool canPopScreen;
  final BottomDecorationAttributes? bottomDecoration;
  final List<AdditionalButtonAttributes>? additionalButtonAttributes;
  final bool hasDividerAfterMessage;
  final CrayonPaymentBrightness brightness;

  SuccessScreenBaseWidgetAttributes({
    this.bottomBarAttributes,
    this.canPopScreen = true,
    required this.items,
    this.crossIconPath,
    this.crossIconPadding,
    this.onCrossIconTap,
    this.appBarAttributes,
    this.padding,
    required this.theme,
    this.backgroundImageUri,
    this.backgroundImageType,
    this.headerTextColor,
    this.mainAxisAlignment = MainAxisAlignment.spaceBetween,
    this.bottomDecoration,
    this.additionalButtonAttributes,
    this.message,
    this.hasDividerAfterMessage = false,
    this.brightness = CrayonPaymentBrightness.dark,
  });
}
