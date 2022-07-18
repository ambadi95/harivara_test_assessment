import 'package:flutter/material.dart';
import 'package:widget_library/expandable_details/widgets/expand_details_info_line.dart';
import 'package:widget_library/static_text/crayon_payment_text.dart';

class ExpandDetailsBottomRow extends ExpandDetailsInfoLine {
  ExpandDetailsBottomRow({
    required String leftSide,
    required Widget rightSide,
    Color? textColor,
  }) : super(
          leftSide: leftSide,
          rightSide: rightSide,
          textColor: textColor ?? Colors.black,
          textStyleVariant: CrayonPaymentTextStyleVariant.headline4,
        );
}
