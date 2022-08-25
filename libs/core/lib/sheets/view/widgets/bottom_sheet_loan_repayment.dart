import 'package:config/Colors.dart';
import 'package:config/Styles.dart';
import 'package:core/sheets/coordinator/crayon_payment_bottom_sheet_coordinator.dart';
import 'package:core/sheets/data_model/button_options.dart';
import 'package:core/sheets/data_model/loading_bottom_sheet_options.dart';
import 'package:core/sheets/data_model/loan_payment.dart';
import 'package:core/sheets/state/crayon_payment_bottom_sheet_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:widget_library/buttons/docked_button.dart';
import 'package:widget_library/buttons/text_button.dart';
import 'package:widget_library/html/rich_text_description.dart';
import 'package:widget_library/static_text/crayon_payment_text.dart';
import '../../data_model/loan_repayment.dart';

class BottomSheetLoanRepayment extends StatelessWidget {
  static final String _identifier = 'BottomSheetLoanRepayment';
  final LoanRepaymentBottomSheet _sheetState;
  final CrayonPaymentBottomSheetCoordinator coordinator;

  const BottomSheetLoanRepayment(
    this.coordinator,
    this._sheetState, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      key: Key('$_identifier'),
      children: [
        _buildTitlePayingFor,
        SizedBox(
          height: 16,
        ),
        _deviceLoanContainer,
        SizedBox(
          height: 24,
        ),

        Align(
          alignment: Alignment.topLeft,
            child: _buildTitleAmountToPay),
        SizedBox(
          height: 14,
        ),
        GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                childAspectRatio: 3 / 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20
            ),
            itemCount: _sheetState.loanRepayment.loanPaymentList.length,
            itemBuilder: (BuildContext ctx, index) {
              return _paymentWidget(
                  _sheetState.loanRepayment.loanPaymentList[index]);
            }),
        SizedBox(
          height: 24,
        ),
        CrayonPaymentDockedButton(
          key: const Key('bottomButtonDocked'),
          title: 'Pay Now',
          buttonColor: SU_button_color,
          onPressed: _sheetState.loanRepayment.onPressedPayNow,
        )
      ],
    );
  }

  Widget get _buildImage {
    return SvgPicture.asset(
      _sheetState.loanRepayment.imageUrl,
      key: const Key('mobileImage'),
    );
  }

  Padding get _buildTitlePayingFor {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: RichTextDescription(
        description: _sheetState.loanRepayment.label1,
        key: const Key('title'),
        // linkTextStyle: ES_bold_text,
        // descriptionTextStyle: ES_success_text,
      ),
    );
  }

  RichTextDescription get _buildTitleDeviceLoan {
    return RichTextDescription(
      textAlign: TextAlign.center,
      description: _sheetState.loanRepayment.label2,
      key: const Key('subtitle1'),
      // linkTextStyle: ES_bold_text,
      // descriptionTextStyle: ES_success_text,
    );
  }

  RichTextDescription get _buildDeviceLoanId {
    return RichTextDescription(
      textAlign: TextAlign.center,
      description: _sheetState.loanRepayment.loanId,
      key: const Key('subtitle2'),
      linkTextStyle: ES_bold_text,
      descriptionTextStyle: ES_success_text,
    );
  }

  RichTextDescription get _buildTitleAmountToPay {
    return RichTextDescription(
      textAlign: TextAlign.center,
      description: _sheetState.loanRepayment.label3,
      key: const Key('subtitle3'),
      // linkTextStyle: ES_bold_text,
      // descriptionTextStyle: ES_success_text,
    );
  }

  Widget get _deviceLoanContainer {
    LoanType _loan = LoanType.DeviceLoan;
    return Container(
      decoration: BoxDecoration(color: Color(0xFFF4EEEB)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SvgPicture.asset(
            _sheetState.loanRepayment.imageUrl,
            key: const Key('mobileImage1'),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildTitleDeviceLoan,
              _buildDeviceLoanId,
            ],
          ),
          Radio(
            activeColor: SU_button_color,
              value: LoanType.DeviceLoan,
              groupValue: _loan,
              onChanged: (value) {})
        ],
      ),
    );
  }

  Widget _paymentWidget(LoanPaymentMethod paymentMethod) {
    PaymentType paymentType = PaymentType.DailyRepayment;
    return Container(
      decoration: BoxDecoration(color: Color(0xFFF3F4FA)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding:  EdgeInsets.only(left: 20,top: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichTextDescription(
                  description: paymentMethod.name,
                  key: const Key('subtitle6'),
                  // linkTextStyle: ES_bold_text,
                  // descriptionTextStyle: ES_success_text,
                ),
                SizedBox(height: 10,),
                RichTextDescription(
                  textAlign: TextAlign.center,
                  description: paymentMethod.amount,
                  key: const Key('subtitle7'),
                  linkTextStyle: ES_bold_text,
                  descriptionTextStyle: LR_payment_amount,
                )
              ],
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.topRight,
              child: Radio(
                activeColor: SU_button_color,
                  value: PaymentType.DailyRepayment,
                  groupValue: paymentType,
                  onChanged: (value) {}),
            ),
          )
        ],
      ),
    );
  }

}
