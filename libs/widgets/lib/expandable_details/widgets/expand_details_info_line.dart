import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:widget_library/expandable_details/data_model/expandable_details_options.dart';
import 'package:widget_library/page_header/text_ui_data_model.dart';
import 'package:widget_library/static_text/crayon_payment_text.dart';

class ExpandDetailsInfoLine extends ExpandableDetailsOptions {
  final String leftSide;
  final Widget rightSide;
  final Color? textColor;
  final CrayonPaymentTextStyleVariant? textStyleVariant;

  ExpandDetailsInfoLine({
    required this.leftSide,
    required this.rightSide,
    this.textColor,
    this.textStyleVariant,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [Expanded(child: _buildText(leftSide)), rightSide],
    );
  }

  CrayonPaymentText _buildText(String text) {
    return CrayonPaymentText(
      text: TextUIDataModel(
        text.tr,
        color: textColor ?? Colors.black54,
        styleVariant: textStyleVariant ?? CrayonPaymentTextStyleVariant.bodyText2,
      ),
    );
  }
}
