import 'package:config/Colors.dart';
import 'package:core/logging/logger.dart';
import 'package:core/navigation/modal_bottom_sheet.dart';
import 'package:core/navigation/navigation_manager.dart';
import 'package:core/navigation/navigation_type.dart';
import 'package:core/sheets/data_model/button_options.dart';
import 'package:core/sheets/data_model/loan_payment.dart';
import 'package:core/sheets/data_model/loan_repayment.dart';
import 'package:core/sheets/state/crayon_payment_bottom_sheet_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:home/home/home_module.dart';
import 'package:loan_details/view/loan_detail_screen.dart';
import 'package:payments/view/payments_screen.dart';
import 'package:scanqrcode/view/scanqrcode_screen.dart';
import 'package:shared_data_models/loan_detail/loan_detail_screen_args.dart';
import 'package:shared_data_models/loan_detail/response/loan_detail_response/loan_detail_response.dart';
import 'package:shared_data_models/payments/payments_screen_args.dart';
import 'package:shared_data_models/signup/sign_up_type.dart';
import 'package:welcome/data_model/sign_up_arguments.dart';
import 'package:welcome/sub_features/signup/sub_features/customer_registration_options/view/registration_approval.dart';
import 'package:welcome/sub_features/signup/view/signup.dart';
import 'package:widget_library/helpers/error/helper/error_helper.dart';
import 'package:settings/view/settings_view.dart';
import 'package:config/Config.dart';
import 'package:widget_library/icons/crayon_payment_bottom_sheet_icon.dart';
import 'package:widget_library/page_header/text_ui_data_model.dart';
import 'package:widget_library/webview/webview.dart';
import 'package:url_launcher/url_launcher.dart';

import '../constants/image_constant.dart';

class HomeNavigationHandler with ErrorHandler {
  final NavigationManager _navigationManager;

  HomeNavigationHandler(this._navigationManager);

  Future<void> goBack() async {
    _navigationManager.goBack();
  }

  Future<void> navigateTodevice(UserType userType) async {
    await _navigationManager.navigateTo(
      ScanQrCodeScreen.viewPath,
      const NavigationType.push(),
    );
  }

  Future<void> navigateToSignUpScreen(UserType userType) async {
    var arguments = SignUpArguments('SU_title', 'SU_subtitle',
        UserType.Customer, SignupType.agentAidedCustomerOnBoarding, true);
    await _navigationManager.navigateTo(
        RegistrationApproval.viewPath, const NavigationType.push(),
        arguments: arguments);
  }

  Future<void> navigateToSettingsScreen() async {
    await _navigationManager.navigateTo(
      Settings.viewPath,
      const NavigationType.push(),
    );
  }

  Future<void> navigateToCustomPayBottomSheet({
    String outstandingAmount = '',
  }) async {
    await goBack();
    String _selectedAmount = "";
    String _selectedPaymentMethod = "Paying Custom Amount";

    final CrayonPaymentBottomSheetState infoState =
        CrayonPaymentBottomSheetState.customAmount(
            buttonOptions: [
          ButtonOptions(
            Black,
            'LR_proceed',
            () =>  navigateToPaymentScreen(_selectedAmount,_selectedPaymentMethod),
            false,
          ),
        ],
            title: 'CA_custom_amount',
            isAmountValidated: false,
            enteredAmount: (String value) {
              _selectedAmount = value + " TZSHS";
            },
            onSelectedLabel: (String value) {
              _selectedAmount = "Paying Custom Amount";
            },

            outstandingAmount: outstandingAmount ?? "");

    _navigationManager.navigateTo(
      'bottomSheet/crayonPaymentBottomSheet',
      const NavigationType.bottomSheet(),
      arguments: infoState,
    );
  }

  int removeCharacter(String amount){
    return int.parse(amount.replaceAll(",", "").replaceAll("TZSHS", "").trim());
  }

  Future<void> navigateToPaymentScreen(String paymentPrice, String paymentMethod) async {
    PaymentsScreenArgs paymentsScreenArgs = PaymentsScreenArgs(
      HS_LoanRepaymentMock,
      paymentMethod,
      paymentPrice,
    );

    await _navigationManager.navigateTo(
      PaymentsScreen.viewPath,
      arguments: paymentsScreenArgs,
      const NavigationType.push(),
    );
  }

  Future<void> navigateToLoanDetailScreen(
      LoanDetailResponse loanDetailResponse) async {
    var loanArguments = LoanDetailArgs(loanDetailResponse);
    await _navigationManager.navigateTo(
      LoanDetailScreen.viewPath,
      const NavigationType.push(),
      arguments: loanArguments,
    );
  }

  Future<void> navigateToLoanRepaymentBottomSheet(
      String message,
      String buttonLabel,
      BuildContext context,
      LoanDetailResponse loanDetailResponse) async {
    String _selectedAmount = "";
    String _selectedMethod = "";
    final CrayonPaymentBottomSheetState infoState =
        CrayonPaymentBottomSheetState.loanRepayment(
            loanRepayment: LoanRepayment(
      label1: 'LR_paying_for',
      label2: 'LR_device_loan',
      label3: 'LR_amount_to_pay',
      imageUrl: loanDetailResponse.data?.modelNumber == "A03 Core"
          ? LD_loan_detail_banner_image2
          : LD_loan_detail_banner_image,
      infoMessage: '',
      selectedAmount: _selectedAmount,
      loanId: loanDetailResponse.data != null
          ? loanDetailResponse.data?.loanId ?? "-"
          : "648960359535569",
      onPressedCustomAmount: () => navigateToCustomPayBottomSheet(
          outstandingAmount: loanDetailResponse.data != null
              ? loanDetailResponse.data!.outStandingAmount! + " TZSHS"
              : "4,500 TZSHS",),
      onPressedPayNow: () {
        navigateToPaymentScreen(_selectedAmount,_selectedMethod);
      },
      loanPaymentList: [
        LoanPaymentMethod(
            name: 'LR_due_amount',
            amount: loanDetailResponse.data != null
                ? loanDetailResponse.data!.outStandingAmount! + " TZSHS"
                : "4,500 TZSHS",
            isSelected: false,
            selectedOption: 'LR_due_amount'),
        LoanPaymentMethod(
            name: 'LR_daily_repayment',
            amount: loanDetailResponse.data != null
                ? loanDetailResponse.data!.dailyRepaymentAmount! + " TZSHS"
                : "2,000 TZSHS",
            isSelected: false,
            selectedOption: 'LR_daily_repayment'),
        LoanPaymentMethod(
            name: 'LR_loan_amount',
            amount: loanDetailResponse.data != null
                ? loanDetailResponse.data!.totalAmountToBeRepaid! + " TZSHS"
                : "7,70,000 TZSHS",
            isSelected: false,
            selectedOption: 'LR_loan_amount'),
        LoanPaymentMethod(
            name: 'LR_custom_amount',
            amount: "",
            isSelected: false,
            selectedOption: 'LR_custom_amount'),
      ],
      onSelectedAmount: (String value) {
        _selectedAmount = value;
        CrayonPaymentLogger.logInfo(_selectedAmount);
      },
      onSelectedLabel: (String value) {
        _selectedMethod = value;
      }
    ));

    _navigationManager.navigateTo('bottomSheet/crayonPaymentBottomSheet',
        const NavigationType.bottomSheet(),
        arguments: infoState,
        //barrierDismissiable: true,
        modalBottomSheet: ModalBottomSheet(
          context: context,
          height: MediaQuery.of(context).size.height * 0.60,
        ));
  }

  void navigateToTermsCondition() async {
    var uri = Uri.parse("https://y9bank.com/term-of-services/");
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch ${uri.toString()}';
    }
  }

  navigateToBrowser(String text, String path) async {
    var arguments = {'text': text, 'path': path};
    return WebViewPage(
      title: TextUIDataModel(text!),
      launchType: LaunchType.Network,
      url: path,
      leadingActionIcon: const Icon(Icons.arrow_back),
    );
  }

  Future<void> navigateToLoanDetailsSheetCustomer() async {
    final CrayonPaymentBottomSheetIcon icon =
        CrayonPaymentBottomSheetExclamatoryIcon();
    final CrayonPaymentBottomSheetState infoState =
        CrayonPaymentBottomSheetState.infoState(
      buttonOptions: [ButtonOptions(Black, "Close", () => goBack(), false)],
      disableCloseButton: true,
      bottomSheetIcon: icon,
      subtitle: "No Loan Details available for this user",
    );

    _navigationManager.navigateTo(
      'bottomSheet/crayonPaymentBottomSheet',
      const NavigationType.bottomSheet(),
      arguments: infoState,
    );
  }
}
