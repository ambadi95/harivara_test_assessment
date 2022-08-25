import 'package:config/Colors.dart';
import 'package:core/navigation/navigation_manager.dart';
import 'package:core/navigation/navigation_type.dart';
import 'package:core/sheets/data_model/button_options.dart';
import 'package:core/sheets/data_model/loan_payment.dart';
import 'package:core/sheets/data_model/loan_repayment.dart';
import 'package:core/sheets/state/crayon_payment_bottom_sheet_state.dart';
import 'package:shared_data_models/signup/sign_up_type.dart';
import 'package:welcome/data_model/sign_up_arguments.dart';
import 'package:welcome/sub_features/signup/sub_features/customer_registration_options/view/registration_approval.dart';
import 'package:welcome/sub_features/signup/view/signup.dart';
import 'package:widget_library/helpers/error/helper/error_helper.dart';
import 'package:settings/view/settings_view.dart';
import 'package:config/Config.dart';
import 'package:widget_library/icons/crayon_payment_bottom_sheet_icon.dart';

class HomeNavigationHandler with ErrorHandler {
  final NavigationManager _navigationManager;

  HomeNavigationHandler(this._navigationManager);

  Future<void> goBack() async {
    _navigationManager.goBack();
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

  Future<void> navigateToAgentEnrollmentBottomSheet(
      String message, String buttonLabel) async {
    final CrayonPaymentBottomSheetIcon icon =
    CrayonPaymentBottomSheetSuccessIcon();
    final CrayonPaymentBottomSheetState infoState =
    CrayonPaymentBottomSheetState.agentEnrollment(

      buttonOptions: [
        ButtonOptions(Black, buttonLabel, () => (){}, false)
      ],
      disableCloseButton: true,
      bottomSheetIcon: icon,
      title: message,
    );

    _navigationManager.navigateTo(
      'bottomSheet/crayonPaymentBottomSheet',
      const NavigationType.bottomSheet(),
      arguments: infoState,
    );
  }

  Future<void> navigateToLoanRepaymentBottomSheet(
      String message, String buttonLabel) async {
    final CrayonPaymentBottomSheetState infoState =
        CrayonPaymentBottomSheetState.loanRepayment(
            loanRepayment: LoanRepayment(
      label1: 'LR_paying_for',
      label2: 'LR_device_loan',
      label3: 'LR_amount_to_pay',
      imageUrl: "",
      infoMessage: '',
      loanId: '64512378965435',
      onPressedCustomAmount: (){},
      onPressedPayNow: (){},
      loanPaymentList: [
        LoanPaymentMethod(
            name: 'LR_due_amount', amount: "4,500TZSHS", isSelected: false),
        LoanPaymentMethod(
            name: 'LR_daily_repayment',
            amount: '2,000TZSHS',
            isSelected: false),
        LoanPaymentMethod(
            name: 'LR_loan_amount', amount: "7,70,000TZSHS", isSelected: false),
        LoanPaymentMethod(
            name: 'LR_custom_amount', amount: "", isSelected: false),
      ],
    ));

    _navigationManager.navigateTo(
      'bottomSheet/crayonPaymentBottomSheet',
      const NavigationType.bottomSheet(),
      arguments: infoState,
    );
  }
}
