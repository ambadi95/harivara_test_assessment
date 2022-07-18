import 'package:flutter/cupertino.dart';
import 'package:widget_library/buttons/docked_button_bar.dart';
import 'package:widget_library/page_header/text_ui_data_model.dart';

class CrayonPaymentSuccessBaseWidgetAttribute {
  final String? svg;
  final String? topHeading;
  final String? title;
  final String? description;
  final List<ItemValueAttribute?>? itemValueAttributes;
  final TextAlign? itemValueTextAlign;
  final VoidCallback? onSwipedToConfirm;
  final List<CrayonPaymentDockedButtonBarElementDetails>? bottomButtons;
  final double? topPadding;
  final ScrollPhysics? itemValueListScrollPhysics;
  final int mainContentFlex;
  final int headerFlex;

  CrayonPaymentSuccessBaseWidgetAttribute({
    this.svg,
    this.topHeading,
    this.title,
    this.description,
    this.onSwipedToConfirm,
    this.itemValueAttributes,
    this.bottomButtons,
    this.topPadding,
    this.itemValueListScrollPhysics,
    this.mainContentFlex = 3,
    this.headerFlex = 1,
    this.itemValueTextAlign,
  });

  CrayonPaymentSuccessBaseWidgetAttribute copyWith({
    String? svg,
    String? topHeading,
    String? title,
    String? description,
    List<ItemValueAttribute?>? itemValueAttributes,
    VoidCallback? onSwipedToConfirm,
    List<CrayonPaymentDockedButtonBarElementDetails>? bottomButtons,
  }) =>
      CrayonPaymentSuccessBaseWidgetAttribute(
        svg: svg ?? this.svg,
        topHeading: topHeading ?? this.topHeading,
        title: title ?? this.title,
        description: description ?? this.description,
        itemValueAttributes: itemValueAttributes ?? this.itemValueAttributes,
        onSwipedToConfirm: onSwipedToConfirm ?? this.onSwipedToConfirm,
        bottomButtons: bottomButtons ?? this.bottomButtons,
        itemValueListScrollPhysics: itemValueListScrollPhysics,
        mainContentFlex: mainContentFlex,
        topPadding: topPadding,
        headerFlex: headerFlex,
        itemValueTextAlign: itemValueTextAlign,
      );
}

class ItemValueAttribute {
  final TextUIDataModel item;
  final TextUIDataModel value;

  ItemValueAttribute({required this.item, required this.value});
}
