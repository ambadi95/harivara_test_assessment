import 'package:core/utils/translation/common.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:widget_library/colors/crayon_payment_colors.dart';
import 'package:get/get.dart';

class LimitText extends StatelessWidget {
  final String _limitValue;

  const LimitText(this._limitValue, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var isArabic = checkIsArabic;
    return !isArabic
        ? Text(
            '${"add-fund-subtitle-currency".tr} ${_limitValue}',
            key: const Key('limitText_english'),
            style: Theme.of(context)
                .textTheme
                .bodyText2!
                .copyWith(color: CrayonPaymentColors.crayonPaymentBlack),
          )
        : Text(
            '${_limitValue} ${"add-fund-subtitle-currency".tr}',
            key: const Key('limitText_arabic'),
            style: Theme.of(context)
                .textTheme
                .bodyText2!
                .copyWith(color: CrayonPaymentColors.crayonPaymentBlack),
          );
  }
}
