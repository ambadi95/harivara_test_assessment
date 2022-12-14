import 'package:config/Config.dart';
import 'package:widget_library/utils/app_utils.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:task_manager/base_classes/base_view_model.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:widget_library/bottom_sheet/alert_bottom_sheet.dart';
import '../../../../../navigation_handler/welcome_navigation_handler.dart';
import '../../../viewmodel/signup_usecase.dart';
import '../state/onboarding_approval_state.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class CustomerOnBoardingApprovalCoordinator
    extends BaseViewModel<OnBoardingApprovalState> {
  final WelcomeNavigationHandler _navigationHandler;
  final SignupUseCase _signupUseCase;

  CustomerOnBoardingApprovalCoordinator(this._navigationHandler, this._signupUseCase)
      : super(const OnBoardingApprovalState());

  void goBack() async {
    _navigationHandler.goBack();
  }

  void navigateToTermsCondition() {
    _navigationHandler.navigateToTermsCondtionsScreen();
  }

  validateMobileNumber(String mobileNumber) {
    if (mobileNumber.length == 11) {
      state = state.copyWith(mobileNumberError: 'LS_mobile_error_text');
    } else {
      state = state.copyWith(mobileNumberError: '');
    }
  }

  validateReferenceId(String referenceId) {
    if (referenceId.isEmpty) {
      state = state.copyWith(referenceIdError: 'PC_ref_id_error_text');
    } else {
      state = state.copyWith(referenceIdError: '');
    }
  }

  validateForm(String mobNumber, String reference) {
    if (mobNumber.length == 11) {
      state = state.copyWith(isValid: true);
    } else {
      state = state.copyWith(isValid: false);
    }
  }

  Future getCustomerDetails(String mobileNumber, String referenceID) async {
    state = state.copyWith(isLoading: true);
    try {
      var detailResponse = await _signupUseCase
          .getCustomerDetailsByMobileNumber(
          '+255' + mobileNumber, (p0) => null);
      if (detailResponse!.status == true) {
        state = state.copyWith(isCustomerExist: true,
            referenceId: detailResponse.data!.referenceId.toString(),
            customerId: detailResponse.data!.customerId.toString(),
            isLoading: false);
      } else {
        state = state.copyWith(isLoading: false);
        _showAlertDataMismatch();
      }
    }catch (e){
      print(e.toString());
      AppUtils.appUtilsInstance.showErrorBottomSheet(
        title: e.toString(),
        onClose: () {
          goBack();
        },
      );
    }
  }

  Future navigateToOtpScreen(String mobileNumber, String customerId) async {
    _navigationHandler.navigateToOtpScreenCustomerSignUpByAgent(
        UserType.AgentCustomer,mobileNumber,userId: customerId);
  }

  _showAlertDataMismatch() {
    Get.bottomSheet(
      AlertBottomSheet(
          alertMessage: 'PC_alert_message'.tr,
          alertTitle: 'PC_alert_title'.tr,
          alertIcon: "assets/images/alert_icon.png",
          bottomButtonText: 'PC_button_close'.tr,
          onBottomButtonPress: () {
            goBack();
          },
          // onClose: () {
          //   goBack();
          // },
          packageName: ""),
      isScrollControlled: false,
      isDismissible: true,
    );
  }
}
