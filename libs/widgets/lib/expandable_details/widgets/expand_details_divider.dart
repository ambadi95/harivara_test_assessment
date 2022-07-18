import 'package:flutter/material.dart';
import 'package:widget_library/colors/crayon_payment_colors.dart';
import 'package:widget_library/expandable_details/data_model/expandable_details_options.dart';

class ExpandDetailsDivider extends ExpandableDetailsOptions {
  ExpandDetailsDivider({Key? key}) : super(key: key);

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
