import 'package:config/Colors.dart';
import 'package:core/navigation/navigation_manager.dart';
import 'package:core/navigation/navigation_type.dart';
import 'package:core/sheets/data_model/button_options.dart';
import 'package:core/sheets/data_model/loan_payment.dart';
import 'package:core/sheets/data_model/loan_repayment.dart';
import 'package:core/sheets/state/crayon_payment_bottom_sheet_state.dart';
import 'package:flutter/cupertino.dart';
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

  Future<void> navigateToCustomPayBottomSheet() async {
    await goBack();

    final CrayonPaymentBottomSheetState infoState =
        CrayonPaymentBottomSheetState.customAmount(
      buttonOptions: [
        ButtonOptions(
          Black,
          'LR_proceed',
          () => () {},
          false,
        )
      ],
      title: 'CA_custom_amount',
    );

    _navigationManager.navigateTo(
      'bottomSheet/crayonPaymentBottomSheet',
      const NavigationType.bottomSheet(),
      arguments: infoState,
    );
  }

  Future<void> navigateToPaymentScreen(String paymentPrice) async {
    PaymentsScreenArgs paymentsScreenArgs = PaymentsScreenArgs(
      HS_LoanRepaymentMock,
      'Paying Custom Amount',
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

  String _selectedAmount = "";

  Future<void> navigateToLoanRepaymentBottomSheet(
    String message,
    String buttonLabel,
  ) async {

    final CrayonPaymentBottomSheetState infoState =
        CrayonPaymentBottomSheetState.loanRepayment(
            loanRepayment: LoanRepayment(
      label1: 'LR_paying_for',
      label2: 'LR_device_loan',
      label3: 'LR_amount_to_pay',
      imageUrl: HS_LoanRepaymentMock,
      infoMessage: '',
      selectedAmount:_selectedAmount ,
      loanId: '64512378965435',
      onPressedCustomAmount: () => navigateToCustomPayBottomSheet(),
      onPressedPayNow: () {
        navigateToPaymentScreen(_selectedAmount);
      },
      loanPaymentList: [
        LoanPaymentMethod(
          name: 'LR_due_amount',
          amount: "4,500TZSHS",
          isSelected: false,
        ),
        LoanPaymentMethod(
          name: 'LR_daily_repayment',
          amount: '2,000TZSHS',
          isSelected: false,
        ),
        LoanPaymentMethod(
          name: 'LR_loan_amount',
          amount: "7,70,000TZSHS",
          isSelected: false,
        ),
        LoanPaymentMethod(
          name: 'LR_custom_amount',
          amount: "",
          isSelected: false,
        ),
      ],
    ));

    _navigationManager.navigateTo(
      'bottomSheet/crayonPaymentBottomSheet',
      const NavigationType.bottomSheet(),
      arguments: infoState,
    );
  }
}
