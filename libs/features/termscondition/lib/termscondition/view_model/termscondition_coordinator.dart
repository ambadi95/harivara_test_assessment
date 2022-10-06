import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:config/Config.dart';
import 'package:settings/view_model/settings_usecase.dart';
import 'package:task_manager/base_classes/base_view_model.dart';
import 'package:termscondition/termscondition/state/termscondition_state.dart';
import 'package:termscondition/termscondition/view_model/termscondition_usecase.dart';
import 'package:widget_library/bottom_sheet/alert_bottom_sheet.dart';
import 'package:get/get.dart';
import '../navigation_handler/terms_navigation_handler.dart';

class TermsConditionCoordinator extends BaseViewModel<TermsConditionState> {
  final TermsConditionUseCase _termsconditionUseCase;
  final TermsConditionNavigationHandler _navigationHandler;

  TermsConditionCoordinator(
      this._navigationHandler, this._termsconditionUseCase)
      : super(const TermsConditionState.initialState());

  void goBack() async {
    _navigationHandler.goBack();
  }

  void naigateToDetailScreen(UserType userType){
    _navigationHandler.navigateToDetailScreen(userType);
  }


  void naigateToAgentDetailScreen(UserType userType){
    _navigationHandler.navigateToAgentDetailScreen(userType);
  }

  void naigateToPasscodeScreen(UserType userType){
    _navigationHandler.openForNewPasscodeAgentCustomer(userType);
  }


  Future saveConsentForAgentAPI(
      BuildContext context,
      UserType userType
      ) async {
    state = TermsConditionState.ready(context: context,isLoading:true);
    var response = await _termsconditionUseCase.saveConsentAgent((p0) => null);
    if (response?.status == true) {
      state = TermsConditionState.ready(context: context,isLoading:false );
      if(response?.message == "T&C Consent has been updated successfully."){
        naigateToAgentDetailScreen(userType);
      }
    } else {
      state = TermsConditionState.ready(context: context,isLoading:false,error: response!.message!);
      _showAlertForErrorMessage(response.message!);
      if (kDebugMode) {
        print(response.message);
      }
    }
  }

  Future saveConsentForPasscodeAPI(
      BuildContext context,
      UserType userType
      ) async {
    state = TermsConditionState.ready(context: context,isLoading:true);
    var response = await _termsconditionUseCase.saveConsentCustomer((p0) => null);
    if (response?.status == true) {
      state = TermsConditionState.ready(context: context,isLoading:false );
      if(response?.message == "T&C Consent has been updated successfully."){
        naigateToPasscodeScreen(userType);
      }
    } else {
      state = TermsConditionState.ready(context: context,isLoading:false,error: response!.message!);
      _showAlertForErrorMessage(response.message!);
      if (kDebugMode) {
        print(response.message);
      }
    }
  }

  Future saveConsentForCustomerAPI(
      BuildContext context,
      UserType userType
      ) async {
    state = TermsConditionState.ready(context: context,isLoading:true);
    var response = await _termsconditionUseCase.saveConsentCustomer((p0) => null);
    if (response?.status == true) {
      state = TermsConditionState.ready(context: context,isLoading:false );
      if(response?.message == "T&C Consent has been updated successfully."){
        naigateToDetailScreen(userType);
      }
    } else {
      state = TermsConditionState.ready(context: context,isLoading:false,error: response!.message!);
      _showAlertForErrorMessage(response.message!);
      if (kDebugMode) {
        print(response.message);
      }
    }
  }

  _showAlertForErrorMessage(String errorMessage) {
    Get.bottomSheet(
      AlertBottomSheet(
          alertMessage: errorMessage,
          alertTitle: 'Error',
          alertIcon: "assets/images/alert_icon.png",
          onClose: () {
            goBack();
          },
          packageName: ""),
      isScrollControlled: false,
      isDismissible: true,
    );
  }

}
