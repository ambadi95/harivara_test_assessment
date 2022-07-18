import 'package:flutter/material.dart';
import 'package:widget_library/refund_expandable_details/widgets/refund_expand_details_info_line.dart';
import 'package:widget_library/static_text/crayon_payment_text.dart';

class RefundExpandDetailsBottomRow extends RefundExpandDetailsInfoLine {
  RefundExpandDetailsBottomRow({
    required String leftSide,
    required String rightSide,
    required String middle1,
    required String middle2,
  }) : super(
          leftSide: leftSide,
          rightSide: rightSide,
          middle1: middle1,
          middle2: middle2,
          textColor: Colors.black,
          textWidth: 120,
          fullBlack: true,
          textStyleVariant: CrayonPaymentTextStyleVariant.headline4,
        );
}
