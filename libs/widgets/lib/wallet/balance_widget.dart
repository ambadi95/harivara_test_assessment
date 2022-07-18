import 'package:core/utils/translation/common.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:widget_library/dimensions/crayon_payment_dimensions.dart';

class BalanceWidget extends StatelessWidget {
  const BalanceWidget(this._balanceAmt, {Key? key}) : super(key: key);
  final String _balanceAmt;

  @override
  Widget build(BuildContext context) {
    final isArabic = checkIsArabic;
    return Container(
      padding: EdgeInsets.only(top: CrayonPaymentDimensions.dividerMargin),
      child: Row(
        children: [
          Expanded(
            child: Text(
              'add-fund-balance-notice'.tr,
              style: Theme.of(context)
                  .textTheme
                  .bodyText2!
                  .copyWith(color: Colors.black),
            ),
          ),
          if (isArabic) ...[_buildBalanceText, _buildCurrency(context)],
          if (!isArabic) ...[_buildCurrency(context), _buildBalanceText]
        ],
      ),
    );
  }

  Text get _buildBalanceText {
    return Text(
      ' $_balanceAmt ',
      key: const Key('balanceText'),
    );
  }

  Text _buildCurrency(BuildContext context) {
    return Text(
      'add-fund-currency'.tr,
      style:
          Theme.of(context).textTheme.bodyText2!.copyWith(color: Colors.black),
    );
  }
}
