import 'package:config/Config.dart';
import 'package:flutter/material.dart';
import 'package:shared_data_models/loan_detail/response/loan_detail_response/loan_detail_response.dart';
import 'package:task_manager/base_classes/base_view_model.dart';
import 'package:shared_data_models/home/customerCount/customer_count_response/data.dart';
import 'package:widget_library/bottom_sheet/alert_bottom_sheet_out_line_button.dart';
import '../navigation_handler/home_navigation_handler.dart';
import '../state/home_screen_state.dart';
import 'home_usecase.dart';
import 'package:widget_library/utils/app_utils.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class HomeCoordinator extends BaseViewModel<HomeScreenState> {
  final HomeUserCase _customerHomeUseCase;
  final HomeNavigationHandler _navigationHandler;

  HomeCoordinator(this._navigationHandler, this._customerHomeUseCase)
      : super(const HomeScreenState.initialState());

  void initialiseState(
      BuildContext context, String error, bool isAgent, bool isLoading) async {
    state = HomeScreenState.ready(
        context: context, error: error, isAgent: isAgent, isLoading: isLoading);
  }

  void navigateToCustomerRegister() {
    _navigationHandler.navigateToSignUpScreen(UserType.Customer);
  }

  void offlinePayment() {
    _navigationHandler.navigateToOfflinePayment(UserType.Customer);
  }


  void goBack() async {
    _navigationHandler.goBack();
  }

  void navigateToSettingsScreen() {
    _navigationHandler.navigateToSettingsScreen();
  }

  void navigateToLoanDetailScreen(LoanDetailResponse loanDetailResponse) {
    if(loanDetailResponse.data == null){
      _navigationHandler.navigateToLoanDetailsSheetCustomer();
    }else {
      _navigationHandler.navigateToLoanDetailScreen(loanDetailResponse);
    }
  }

  void navigationToBottomSheet(BuildContext context,LoanDetailResponse loanDetailResponse) {
    if(loanDetailResponse.data == null){
      // _navigationHandler.navigateToLoanRepaymentBottomSheet(
      //     "message", "buttonLabel",context,loanDetailResponse);
     _navigationHandler.navigateToLoanDetailsSheetCustomer();
    }else {
      _navigationHandler.navigateToLoanRepaymentBottomSheet(
          "message", "buttonLabel",context,loanDetailResponse);
    }

  }

  void navigationToReaderBrowser(){
    _navigationHandler.navigateToBrowser('dd','https://readnow.world/5yee');
  }

  void navigateToBrowser(){
    _navigationHandler.navigateToTermsCondition();
  }

  Future<String> getAgentId() async {
    String agentId = await _customerHomeUseCase.getAgentId();
    return agentId;
  }

  Future<String> getAgentName() async {
    String agentName = await _customerHomeUseCase.getAgentName();
    return agentName;
  }

  Future<String> getCustomerId() async {
    String agentId = await _customerHomeUseCase.getCustomerId();
    return agentId;
  }

  Future<String> getCustomerName() async {
    String agentName = await _customerHomeUseCase.getCustomerName();
    return agentName;
  }

  Future<String> getAgentType() async {
    String agentType = await _customerHomeUseCase.getAgentType();
    return agentType;
  }

  Future<Data> getCustomerCount() async {
    print('jhgsdjahgsdjgsa');
    try {
      var response = await _customerHomeUseCase.getCustomerCount((p0) => null);
      if (response?.status == true) {
        print(response);
        return response!.data!;
      } else {
        return const Data(enrolledCustomer: '0', initiatedCustomer: '0');
      }
    } catch (e) {
      AppUtils.appUtilsInstance.showErrorBottomSheet(
        title: e.toString(),
        onClose: () {
          goBack();
        },
      );
      throw null!;
    }
  }

  Future<LoanDetailResponse?> getLoanDetails() async {
    try {
      var response = await _customerHomeUseCase.getLoanDetails((p0) => null);
      if (response?.status == true) {
        return response;
      }
    } catch (e) {
      print(e.toString());
      AppUtils.appUtilsInstance.showErrorBottomSheet(
        title: e.toString(),
        onClose: () {
          goBack();
        },
      );
    }

  }

  showReferralAlert() {
    Get.bottomSheet(
      AlertBottomSheetOutlineButton(
          alertMessage: '',
          alertTitle: 'HO_referral_alert_message'.tr,
          alertIcon: "assets/images/comming_soon.png",
          bottomButtonText: 'SU_close'.tr,
          onBottomButtonPress: (){
            goBack();
          },
          packageName: ""),
      isScrollControlled: false,
      isDismissible: true,
    );
  }
}
