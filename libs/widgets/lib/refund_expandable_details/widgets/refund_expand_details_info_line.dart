import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:widget_library/page_header/text_ui_data_model.dart';
import 'package:widget_library/refund_expandable_details/data_model/refund_expandable_details_options.dart';
import 'package:widget_library/static_text/crayon_payment_text.dart';

class RefundExpandDetailsInfoLine extends RefundExpandableDetailsOptions {
  final String leftSide;
  final String rightSide;
  final String middle1;
  final String middle2;
  final Color? textColor;
  final CrayonPaymentTextStyleVariant? textStyleVariant;
  final double? textWidth;
  final bool? fullBlack;

  RefundExpandDetailsInfoLine({
    required this.leftSide,
    required this.rightSide,
    required this.middle2,
    required this.middle1,
    this.textColor,
    this.textStyleVariant,
    this.textWidth,
    this.fullBlack,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildText(leftSide, false, textWidth ?? 40),
        _buildText(middle1, true, textWidth != null ? 0.00 : 70),
        _buildText(middle2, false, 30),
        _buildText(rightSide, true, 50)
      ],
    );
  }

  Container _buildText(String text, bool flag, double width) {
    return Container(
      width: width,
      child: CrayonPaymentText(
        text: TextUIDataModel(
          text.tr,
          color: fullBlack == null
              ? flag
                  ? Colors.black
                  : Colors.black54
              : Colors.black,
          styleVariant: textStyleVariant ?? CrayonPaymentTextStyleVariant.bodyText2,
        ),
      ),
    );
  }
}
