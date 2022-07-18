import 'package:flutter/material.dart';
import 'package:widget_library/colors/crayon_payment_colors.dart';
import 'package:widget_library/refund_expandable_details/data_model/refund_expandable_details_options.dart';

class RefundExpandDetailsDivider extends RefundExpandableDetailsOptions {
  RefundExpandDetailsDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Divider(
      key: const Key('expand_details_divider'),
      color: CrayonPaymentColors.crayonPaymentGold.withAlpha(50),
      height: MediaQuery.of(context).size.height * 0.028,
      thickness: 1.5,
    );
  }
}
