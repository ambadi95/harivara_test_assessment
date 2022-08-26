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
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: ListView(
        shrinkWrap: true,
        key: Key('$_identifier'),
        children: [
          _onTabContainer(context),
          SizedBox(
            height: 32,
          ),
          _buildTitlePayingFor,
          SizedBox(
            height: 16,
          ),
          _deviceLoanContainer,
          SizedBox(
            height: 24,
          ),
          Align(alignment: Alignment.topLeft, child: _buildTitleAmountToPay),
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
                  mainAxisSpacing: 20),
              itemCount: _sheetState.loanRepayment.loanPaymentList.length,
              itemBuilder: (BuildContext ctx, index) {
                return _paymentWidget(
                    _sheetState.loanRepayment.loanPaymentList[index]);
              }),
          SizedBox(
            height: 24,
          ),
          _sheetState.loanRepayment.isAmountSelected
              ? selectedBanner()
              : SizedBox(),
          !_sheetState.loanRepayment.isPayNowSelected
              ? CrayonPaymentDockedButton(
                  key: const Key('bottomButtonDocked'),
                  title: 'Pay Now',
                  borderRadius: 8,
                  buttonColor: _sheetState.loanRepayment.isAmountSelected
                      ? LR_ColorDA2228
                      : LR_Color9CA3AF,
                  onPressed: _sheetState.loanRepayment.onPressedPayNow,
                )
              : CrayonPaymentDockedButton(
                  key: const Key('bottomButtonDocked'),
                  title: 'Pay Now',
                  borderRadius: 8,
                  buttonColor: LR_ColorDA2228,
                  onPressed: _sheetState.loanRepayment.onPressedCustomAmount,
                )
        ],
      ),
    );
  }

  Widget _onTabContainer(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * .3),
      child: Container(
        height: 5,
        decoration: BoxDecoration(
            color: LR_ColorF3F4FA, borderRadius: BorderRadius.circular(4)),
      ),
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
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(width: 25),
            Image.asset(
              _sheetState.loanRepayment.imageUrl,
              key: const Key('mobileImage1'),
              width: 32,
              height: 44,
            ),
            SizedBox(width: 25),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildTitleDeviceLoan,
                _buildDeviceLoanId,
              ],
            ),
            Expanded(
              child: Align(
                alignment: Alignment.topRight,
                child: Radio(
                    activeColor: SU_button_color,
                    value: LoanType.DeviceLoan,
                    groupValue: _loan,
                    onChanged: (value) {}),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _paymentWidget(LoanPaymentMethod paymentMethod) {
    return InkWell(
      onTap: () {
        coordinator.choosePaymentMethod(paymentMethod);
      },
      child: Container(
        decoration: BoxDecoration(
            color:
                paymentMethod.isSelected ? SU_button_color : Color(0xFFF3F4FA)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 20, top: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  paymentMethod.amount.isEmpty
                      ? RichTextDescription(
                          description: paymentMethod.name,
                          key: const Key('subtitle6'),
                          // linkTextStyle: ES_bold_text,
                          descriptionTextStyle: paymentMethod.isSelected
                              ? LR_payCustomSelected
                              : LR_payCustom,
                        )
                      : RichTextDescription(
                          description: paymentMethod.name,
                          key: const Key('subtitle6'),
                          // linkTextStyle: ES_bold_text,
                          descriptionTextStyle: paymentMethod.isSelected
                              ? LR_selected_payment_label
                              : LR_payment_label,
                        ),
                  SizedBox(
                    height: 10,
                  ),
                  RichTextDescription(
                    textAlign: TextAlign.center,
                    description: paymentMethod.amount,
                    key: const Key('subtitle7'),
                    linkTextStyle: ES_bold_text,
                    descriptionTextStyle: paymentMethod.isSelected
                        ? LR_selected_payment_amount
                        : LR_payment_amount,
                  )
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 12, right: 12),
                child: Align(
                  alignment: Alignment.topRight,
                  child: paymentMethod.isSelected ? selectedCircle() : circle(),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget selectedCircle() {
    return Container(
      height: 16,
      width: 16,
      decoration: BoxDecoration(
          color: LR_ColorDA2228,
          border: Border.all(color: LR_White, width: 4),
          borderRadius: BorderRadius.all(Radius.circular(20))),
    );
  }

  Widget circle() {
    return Container(
      height: 16,
      width: 16,
      decoration: BoxDecoration(
          border: Border.all(color: LR_ColorBAB8B2),
          borderRadius: BorderRadius.all(Radius.circular(20))),
    );
  }

  Widget selectedBanner() {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: LR_Color22C55E.withOpacity(.4),
          ),
          padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
          child: Row(
            children: [
              RotatedBox(
                  quarterTurns: 2,
                  child: Icon(
                    Icons.error_outline,
                    color: LR_Color00384E,
                  )),
              SizedBox(
                width: 14,
              ),
              RichTextDescription(
                description: 'LR_payment_label'
                    .replaceAll('{}', _sheetState.loanRepayment.selectedAmount),
                key: const Key('subtitleLebel'),
                linkTextStyle: ES_bold_text,
                descriptionTextStyle: LR_payStatusLabel,
              )
            ],
          ),
        ),
        SizedBox(
          height: 24,
        ),
      ],
    );
  }
}
