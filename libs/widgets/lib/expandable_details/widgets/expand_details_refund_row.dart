import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:widget_library/colors/crayon_payment_colors.dart';
import 'package:widget_library/expandable_details/data_model/expandable_details_options.dart';
import 'package:widget_library/page_header/text_ui_data_model.dart';
import 'package:widget_library/spacers/crayon_payment_spacers.dart';
import 'package:widget_library/static_text/crayon_payment_text.dart';
import 'package:get/get.dart';

class ExpandDetailsRefundRow extends ExpandableDetailsOptions {
  final String _refundId;
  final String _date;
  final String _amount;
  final void Function() _refundIdCallback;
  final double _textWidth;

  ExpandDetailsRefundRow(
    this._refundId,
    this._date,
    this._amount,
    this._refundIdCallback,
    this._textWidth, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CrayonPaymentText(
          text: TextUIDataModel(
            'transaction_details_refund_id'.tr,
            styleVariant: CrayonPaymentTextStyleVariant.headline5,
          ),
          key: Key('refundIdTitle'),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0),
          child: RichText(
            text: TextSpan(
              text: _refundId,
              style: TextStyle(
                color: CrayonPaymentColors.crayonPaymentGold,
                decoration: TextDecoration.underline,
              ),
              recognizer: TapGestureRecognizer()..onTap = _refundIdCallback,
            ),
            key: Key('refundId${_refundId}'),
          ),
        ),
        Row(
          children: [
            CrayonPaymentText(
              text: TextUIDataModel(
                't_details_Date'.tr,
                styleVariant: CrayonPaymentTextStyleVariant.headline5,
              ),
              key: Key('transactionDateTitle'),
            ),
            spaceW10(),
            CrayonPaymentText(
              text: TextUIDataModel(
                _date,
                styleVariant: CrayonPaymentTextStyleVariant.headline5,
                color: CrayonPaymentColors.crayonPaymentBlack,
              ),
              key: Key('transactionDate'),
            ),
            Spacer(),
            CrayonPaymentText(
              text: TextUIDataModel(
                't_details_currency'.tr,
                styleVariant: CrayonPaymentTextStyleVariant.headline5,
              ),
              key: Key('transactionCurrency'),
            ),
            Container(
              alignment: Alignment.topRight,
              width: _textWidth,
              child: CrayonPaymentText(
                text: TextUIDataModel(
                  _amount,
                  styleVariant: CrayonPaymentTextStyleVariant.headline5,
                  color: CrayonPaymentColors.crayonPaymentBlack,
                ),
                key: Key('transactionAmount'),
              ),
            ),
          ],
        )
      ],
    );
  }
}
