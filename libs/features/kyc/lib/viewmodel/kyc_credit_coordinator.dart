import 'package:config/Colors.dart';
import 'package:config/Config.dart';
import 'package:config/Styles.dart';
import 'package:core/mobile_core.dart';
import 'package:core/view/analytics_state_notifier.dart';
import 'package:flutter/material.dart';
import 'package:shared_data_models/device_option/device_option_args.dart';
import 'package:get/get.dart';
import 'package:widget_library/bottom_sheet/alert_bottom_sheet.dart';
import '../navigation_handler/kyc_credit_navigation_handler.dart';
import '../state/kyc_credit_state.dart';
import 'kyc_credit_usecase.dart';

class KycCreditCoordinator extends AnalyticsStateNotifier<KycCreditState> {
  final KycCreditNavigationHandler _navigationHandler;
  final KycCreditUseCase _kycCreditUseCase;

  KycCreditCoordinator(
    this._navigationHandler,
    this._kycCreditUseCase,
  ) : super(const KycCreditState.initialState());


  void initialiseState(
    BuildContext context,
  ) async {
    state = KycCreditState.ready(context: context, error: "", isLoading: false);
  }

  Future<void> showErrorBottomSheet(
      Widget errorWidget, BuildContext context) async {
    await _navigationHandler.showErrorBottomSheet(errorWidget, context);
  }


  //call kyc check
  Future callKycCheck(BuildContext context
      ) async {
      state = KycCreditState.ready(context: context,isLoading:true);
      String mobileNumber = await _kycCreditUseCase.getMobileNumber();
    var response = await _kycCreditUseCase.callKycCheck(mobileNumber,
            (p0) => null);
    if (response?.status == true) {
      state = KycCreditState.ready(context: context,isLoading:false,error: 'Kyc Done' ,isKycError: false,isCreditCheckError: false);
    } else {
      state = KycCreditState.ready(context: context,isLoading:false,error: response!.message! ,isKycError: true,isCreditCheckError: false);
      // _showAlertForErrorMessage(response.message!);
      print(response.message);

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
  //call credit check
  Future callCreditCheck(BuildContext context
      ) async {
      state = KycCreditState.ready(context: context,isLoading:true);

      String customerId=await  _kycCreditUseCase.getCustomerId();
    var response = await _kycCreditUseCase.callCreditCheck(customerId,
            (p0) => null);
    if (response?.status == true) {
      state = KycCreditState.ready(context: context,isLoading:false );
    } else {
      state = KycCreditState.ready(context: context,isLoading:false,error: response!.message!);
      _showAlertForErrorMessage(response.message!);

      print(response.message);
    }
  }

  //
  // call credit score
  Future callCreditScore(BuildContext context
      ) async {
      state = KycCreditState.ready(context: context,isLoading:true);
      String customerId=await  _kycCreditUseCase.getCustomerId();
      print(customerId);
    var response = await _kycCreditUseCase.callCreditScore(customerId,
            (p0) => null);
    if (response?.status == true) {
      state = KycCreditState.ready(context: context,isLoading:false ,isKycError: false,isCreditCheckError: false,error: 'Credit Eligible');
      // await callCreditCheck(context);
    } else {
      state = KycCreditState.ready(context: context,isLoading:false,error: response!.message ?? "Something went wrong,Please try again later",isKycError: false,isCreditCheckError: true);
       // _showAlertForErrorMessage(response.message!);
      print(response.message);
    }
  }



  void goBack() async {
    _navigationHandler.goBack();
  }

  void navigateToDeviceOption(bool isEnrolled, UserType userType) async {
    var argument = DeviceOptionArgs(isEnrolled, '', userType);
    await _navigationHandler.navigateToDeviceOption(argument);
  }
}
