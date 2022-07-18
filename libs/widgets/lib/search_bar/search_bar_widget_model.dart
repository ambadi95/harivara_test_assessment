import 'package:flutter/material.dart';
import 'package:widget_library/static_text/crayon_payment_text.dart';

class SearchBarAttributes {
  final SearchBarDataModel dataModel;
  final SearchBarAppearance appearance;

  SearchBarAttributes({
    SearchBarDataModel? dataModel,
    SearchBarAppearance? appearance,
  })  : dataModel = dataModel ?? const SearchBarDataModel(),
        appearance = appearance ?? const SearchBarAppearance();

  SearchBarAttributes copyWith({
    required final SearchBarDataModel dataModel,
    required final SearchBarAppearance appearance,
  }) =>
      SearchBarAttributes(dataModel: dataModel, appearance: appearance);
}

class SearchBarDataModel {
  final String? hint;
  final CrayonPaymentTextStyleVariant? variant;

  const SearchBarDataModel({
    this.hint,
    this.variant,
  });
}

class SearchBarAppearance {
  final Widget? prefixIcon;
  final String? suffixIcon;
  final Color? backgroundColor;
  final Color? iconColor;
  final double? iconWidth;
  final double height;
  final double contentPadding;
  final double iconPadding;
  final double cornerRadius;

  const SearchBarAppearance({
    this.prefixIcon,
    this.suffixIcon,
    this.backgroundColor,
    this.iconColor,
    this.height = 56,
    this.contentPadding = 16,
    this.iconPadding = 16,
    this.cornerRadius = 4,
    this.iconWidth,
  });
}
