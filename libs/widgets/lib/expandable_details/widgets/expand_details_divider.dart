import 'package:flutter/material.dart';
import 'package:widget_library/colors/crayon_payment_colors.dart';
import 'package:widget_library/expandable_details/data_model/expandable_details_options.dart';

class ExpandDetailsDivider extends ExpandableDetailsOptions {
  final Color? _dividerColor;
  final EdgeInsetsGeometry? dividerPadding;

  ExpandDetailsDivider({
    Color? dividerColor,
    this.dividerPadding,
    Key? key,
  })  : _dividerColor =
            dividerColor ?? CrayonPaymentColors.crayonPaymentGold.withAlpha(50),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: dividerPadding ??
          EdgeInsets.symmetric(
            vertical: MediaQuery.of(context).size.height * 0.005,
          ),
      child: Divider(
        key: const Key('expand_details_divider'),
        color: _dividerColor,
        thickness: 1.5,
      ),
    );
  }
}
