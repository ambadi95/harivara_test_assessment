import 'package:flutter/material.dart';
import 'package:widget_library/expandable_details/widgets/expand_details_info_line.dart';
import 'package:widget_library/static_text/crayon_payment_text.dart';

class ExpandDetailsBottomRow extends ExpandDetailsInfoLine {
  ExpandDetailsBottomRow({
    required String leftSide,
    required Widget rightSide,
    EdgeInsetsGeometry? padding,
    Color? textColor,
  }) : super(
          leftSideString: leftSide,
          rightSideWidget: rightSide,
          textColor: textColor ?? Colors.black,
          padding: padding,
          textStyleVariant: CrayonPaymentTextStyleVariant.headline4,
        );
}
