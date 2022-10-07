import 'dart:developer';

import 'package:config/Colors.dart';
import 'package:config/Styles.dart';
import 'package:core/logging/logger.dart';
import 'package:flutter/material.dart';
import 'package:shared_data_models/customer_onboard/payment_mode_list_respose/payment_mode_list_response/datum.dart';
import 'package:shared_data_models/signup/sign_up_type.dart';
import 'package:task_manager/base_classes/base_view_model.dart';
import 'package:welcome/sub_features/signup/state/signup_state.dart';
import 'package:welcome/sub_features/signup/viewmodel/signup_usecase.dart';
import 'package:widget_library/page_header/text_ui_data_model.dart';
import 'package:widget_library/static_text/crayon_payment_text.dart';
import 'package:widget_library/utils/app_utils.dart';
import '../../../data_model/sign_up_arguments.dart';
import '../../../navigation_handler/welcome_navigation_handler.dart';
import 'package:config/Config.dart';
import 'package:get/get.dart';
import 'package:widget_library/bottom_sheet/alert_bottom_sheet.dart';

class SignUpCoordinator extends BaseViewModel<SignUpState> {
  final SignupUseCase _signupUseCase;
  final WelcomeNavigationHandler _navigationHandler;

  SignUpCoordinator(this._navigationHandler, this._signupUseCase)
      : super(const SignUpState.initialState());

  void goBack() async {
    _navigationHandler.goBack();
  }

  Future navigateToAgentAidedCustomer() async {
    await _navigationHandler.navigateToAgentAidedCustomerOnBoarding();
  }

  Future calljwttoken() async {
    state = const SignUpState.loadingState();

    try {
      var response = await _signupUseCase.callJWTToken((p0) => null);
      if (response?.status == true) {
        state = const SignUpState.initialState();
      } else {
        state = const SignUpState.initialState();

        print(response?.message);
      }
    } catch (e) {
      state = const SignUpState.initialState();
      AppUtils.appUtilsInstance.showErrorBottomSheet(
        title: e.toString(),
        onClose: () {
          goBack();
        },
      );
    }
  }


 Future<void> callNidaAlert(
       BuildContext context) async {
    await _navigationHandler.showErrorBottomSheet(_nidaNumberAlert(context), context);
  }



  Widget _nidaNumberAlert(
      BuildContext context,
      ) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: ListView(
        children: [
          const Image(
            image: AssetImage(AN_Kyc_Credit_ERROR),
            width: 78,
            height: 78,
          ),
          CrayonPaymentText(
            text: TextUIDataModel('NIDA_Mobile_Alert_Title'.tr,
                textAlign: TextAlign.center,
                styleVariant: CrayonPaymentTextStyleVariant.bodyText1,
                color: Black,
                fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: AppUtils.appUtilsInstance.getPercentageSize(
              percentage: 5,
            ),
          ),
          Center(
            child: RichText(
              text: TextSpan(
                text: "NIDA_Mobile_Alert_SubTitle".tr,
                style: const TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 14,
                    color: VO_ResendTextColor,
                    fontWeight: FontWeight.w400),
                children: const <TextSpan>[
                  TextSpan(
                      text: '23',
                      style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                ],
              ),
            ),
          ),
          SizedBox(
            height: AppUtils.appUtilsInstance.getPercentageSize(
              percentage: 5,
            ),
          ),
          CrayonPaymentText(
            text: TextUIDataModel('NIDA_Mobile_Alert_Do_You_Want_Update'.tr,
                textAlign: TextAlign.center,
                styleVariant: CrayonPaymentTextStyleVariant.headline4,
                color: Black,
                fontWeight: FontWeight.w600),
          ),

          SizedBox(
            height: AppUtils.appUtilsInstance.getPercentageSize(
              percentage: 5,
            ),
          ),
          _updateAndProceedButton(
            context,
          ),
          _cancelButton(
            context,
          ),
        ],
      ),
    );
  }

  Widget _updateAndProceedButton(
      BuildContext context,
      ) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
      child: GestureDetector(
        onTap: () async {},
        child: Container(
          width: double.infinity,
          height: 50,
          decoration: BoxDecoration(
              color: SU_button_color, borderRadius: BorderRadius.circular(2.0)),
          child: Center(
            child: Text(
              'UPDATE_AND_PROCEED'.tr,
              style: SU_button_text_style,
            ),
          ),
        ),
      ),
    );
  }

  _cancelButton(
      BuildContext context,
      ) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
      child: GestureDetector(
        onTap: () async {

          _navigationHandler.goBack();
        },
        child: Container(
          width: double.infinity,
          height: 50,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(2.0),
            border: Border.all(color: PRIMARY_COLOR, width: 1),
          ),
          child: Center(
            child: Text(
              'ST_cancel'.tr,
              style: KYC_button_text_style,
            ),
          ),
        ),
      ),
    );
  }

  Future<void> signup(SignUpArguments signUpArguments, String mobileNumber,
      String nindaNumber, String agentId) async {
    try {
      if (signUpArguments.signupType == SignupType.customerSignUp) {
        state = const SignUpState.loadingState();
        var response = await _signupUseCase.signUp(
            nindaNumber.replaceAll("-", ""), mobileNumber.trim(), (p0) => null);
        if (response!.status == true) {
          await continueToOtp(nindaNumber, mobileNumber);
          state = const SignUpState.initialState();
          await _signupUseCase
              .saveCustomerId(response.data?.customerId.toString());

          AppUtils.appUtilsInstance.saveUserType(UserType.Customer);

          _navigationHandler.navigateToOtpScreenCustomerSignUp(
              signUpArguments.userType, mobileNumber,
              userId: response.data?.customerId.toString());
        } else {
          state = const SignUpState.initialState();
          state = SignUpState.mobileNumberError(response.message!);
        }
      } else if (signUpArguments.signupType == SignupType.agentSignUp) {
        state = const SignUpState.loadingState();
        var agentResponse = await _signupUseCase.signUpAgent(
            nindaNumber, agentId, (p0) => null);
        if (agentResponse?.status == true) {
          AppUtils.appUtilsInstance.saveUserType(UserType.Agent);

          await _signupUseCase.saveAgentDetails(nindaNumber, agentId);

          state = const SignUpState.initialState();
          _navigationHandler
              .navigateToTermsAndConditionsScreen(signUpArguments.userType);
        } else {
          state = const SignUpState.initialState();
          state = SignUpState.agentIdError(agentResponse!.message!);
        }
      } else if (signUpArguments.signupType ==
          SignupType.agentAidedCustomerOnBoarding) {
        state = const SignUpState.loadingState();
        var response = await _signupUseCase.signUpCustomerByAgent(
            nindaNumber: nindaNumber.replaceAll("-", ""),
            customerMobile: '+255' + mobileNumber.replaceAll(" ", ""),
            onErrorCallback: (p0) => null,
            agentId: await _signupUseCase.getAgentId());
        if (response!.status == true) {
          await continueToOtp(nindaNumber, mobileNumber);
          state = const SignUpState.initialState();
          await _signupUseCase
              .saveCustomerId(response.data?.customerId.toString());
          _navigationHandler.navigateToOtpScreenCustomerSignUpByAgent(
              UserType.Customer, mobileNumber,
              userId: response.data?.customerId.toString());
        } else {
          state = const SignUpState.initialState();

          if (response.message == "Internal Server Error") {
            _showAlertForErrorMessage(response.message!);
          } else {
            state = SignUpState.mobileNumberError(response.message!);
          }
        }
      } else if (signUpArguments.signupType == SignupType.customerSignUp) {
        state = const SignUpState.loadingState();
        var response = await _signupUseCase.signUp(
            nindaNumber.replaceAll("-", ""), mobileNumber.trim(), (p0) => null);
        if (response!.status == true) {
          await continueToOtp(nindaNumber, mobileNumber);
          state = const SignUpState.initialState();
          await _signupUseCase
              .saveCustomerId(response.data?.customerId.toString());
          _navigationHandler.navigateToOtpScreenCustomerSignUp(
              signUpArguments.userType, mobileNumber,
              userId: response.data?.customerId.toString());
        } else {
          state = const SignUpState.initialState();

          if (response.message == "Internal Server Error") {
            _showAlertForErrorMessage(response.message!);
          } else {
            state = SignUpState.mobileNumberError(response.message!);
          }
        }
      } else if (signUpArguments.signupType == SignupType.resetPasscodeAgent) {
        print('gherer');
        state = const SignUpState.loadingState();
        var agentDetailResponse = await _signupUseCase.getAgentDetail(
            agentId, nindaNumber.replaceAll("-", ""), (p0) => null);
        if (agentDetailResponse?.status == true) {
          state = const SignUpState.initialState();
          _navigationHandler.navigateToOtpScreenAgentResetPasscode(
              signUpArguments.userType,
              agentDetailResponse!.data!.y9AgentId!,
              agentDetailResponse.data!.mobileNo!);
        } else {
          state = const SignUpState.initialState();
          state = SignUpState.agentIdError(agentDetailResponse!.message!);
          CrayonPaymentLogger.logError(agentDetailResponse.message!);
        }
      } else if (signUpArguments.signupType ==
          SignupType.resetPasscodeCustomer) {
        var detailResponse = await _signupUseCase.getCustomerDetails(
            nindaNumber, "+255$mobileNumber", (p0) => null);
        if (detailResponse?.status == true) {
          await _signupUseCase
              .saveCustomerId(detailResponse!.data?.customerId.toString());
          String customerID = detailResponse.data!.customerId.toString();
          _navigationHandler.navigateToOtpScreenCustomerResetPasscode(
              'Customer', mobileNumber, customerID);
        } else {
          state = SignUpState.mobileNumberError(detailResponse!.message!);
          CrayonPaymentLogger.logError(detailResponse.message!);
        }
        // _navigationHandler
        //     .navigateToOtpScreenAgentResetPasscode(signUpArguments.userType);
      } else if (signUpArguments.signupType == SignupType.agentSignUp) {
        state = const SignUpState.loadingState();
        var agentResponse = await _signupUseCase.signUpAgent(
            nindaNumber, agentId, (p0) => null);
        if (agentResponse?.status == true) {
          await _signupUseCase.saveAgentDetails(nindaNumber, agentId);
          state = const SignUpState.initialState();
          _navigationHandler
              .navigateToAgentDetailScreen(signUpArguments.userType);
        } else {
          state = const SignUpState.initialState();
          state = SignUpState.agentIdError(agentResponse!.message!);
        }
      }
      // else if (signUpArguments.signupType ==
      //     SignupType.agentAidedCustomerOnBoarding) {
      //   state = const SignUpState.loadingState();
      //   var response = await _signupUseCase.signUpCustomerByAgent(
      //       nindaNumber: nindaNumber.replaceAll("-", ""),
      //       customerMobile: '+255' + mobileNumber.replaceAll(" ", ""),
      //       onErrorCallback: (p0) => null,
      //       agentId: await _signupUseCase.getAgentId());
      //   if (response!.status == true) {
      //     await continueToOtp(nindaNumber, mobileNumber);
      //     state = const SignUpState.initialState();
      //     await _signupUseCase
      //         .saveCustomerId(response.data?.customerId.toString());
      //     _navigationHandler.navigateToOtpScreenCustomerSignUpByAgent(
      //         UserType.Customer, mobileNumber,
      //         userId: response.data?.customerId.toString());
      //   } else {
      //     state = const SignUpState.initialState();
      //     state = SignUpState.mobileNumberError(response.message!);
      //   }
      // }
    } catch (e) {
      state = const SignUpState.initialState();
      AppUtils.appUtilsInstance.showErrorBottomSheet(
        title: e.toString(),
        onClose: () {
          goBack();
        },
      );
    }
  }

  //showalert for error message
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

  Future navigateDestination(
      SignUpArguments signUpArguments, String mobileNumber) async {
    if (signUpArguments.signupType == SignupType.customerSignUp) {
      _navigationHandler.navigateToOtpScreenCustomerSignUp(
          signUpArguments.userType, mobileNumber);
    } else if (signUpArguments.signupType == SignupType.resetPasscodeAgent) {
      // _navigationHandler
      //     .navigateToOtpScreenAgentResetPasscode(signUpArguments.userType);
    } else if (signUpArguments.signupType == SignupType.resetPasscodeCustomer) {
      // _navigationHandler
      //     .navigateToOtpScreenAgentResetPasscode(signUpArguments.userType);
    } else if (signUpArguments.signupType == SignupType.agentSignUp) {
      _navigationHandler.navigateToAgentDetailScreen(signUpArguments.userType);
    } else if (signUpArguments.signupType ==
        SignupType.agentAidedCustomerOnBoarding) {
      _navigationHandler.navigateToOtpScreenCustomerSignUp(
          signUpArguments.userType, mobileNumber);
    }
  }

  bool _validateForm(String nidaNo, String mobNumber, String agentId,
      SignUpArguments arguments, String agentType, String paymentMode) {
    var agentID = agentId.isNotEmpty;
    var isnidaNumberValid =
        _signupUseCase.isValidNINDAnumber(nidaNo.replaceAll("-", ""));
    var ismobileNoValid = _signupUseCase.isValidMobileNumber(mobNumber);
    var isPaymentModeValid = handlePaymentValidation(arguments)
        ? true
        : _signupUseCase.isValidPaymentMode(paymentMode);
    var _isValid;
    if (agentType.isNotEmpty &&
        !handlePaymentValidation(arguments) &&
        arguments.signupType == SignupType.agentAidedCustomerOnBoarding) {
      _isValid = isnidaNumberValid && ismobileNoValid && isPaymentModeValid;
    } else if (arguments.userType == UserType.Customer) {
      _isValid = isnidaNumberValid && ismobileNoValid;
    } else {
      _isValid = isnidaNumberValid && agentID;
    }
    return _isValid;
  }

  bool handlePaymentValidation(SignUpArguments signUpArguments) {
    if (signUpArguments.title == "ST_update_passcode" ||
        signUpArguments.title == "SU_reset_passcode") {
      return true;
    }
    return false;
  }

  void validateForm(String nidaNo, String mobNumber, String agentId, userType,
      String agentType, String paymentMode) {
    state = SignUpState.SignUpFormState(_validateForm(
        nidaNo, mobNumber, agentId, userType, agentType, paymentMode));
  }

  bool isValidNidaNumber(String nidaNumber) {
    bool result =
        _signupUseCase.isValidNINDAnumber(nidaNumber.replaceAll("-", ""));
    if (!result) {
      state = const SignUpState.nindaNumberError('SU_title_error_text');
    } else {
      state = const SignUpState.nindaNumberError('');
    }
    return result;
  }

  bool isValidMobileNumber(String mobileNumber) {
    bool result = _signupUseCase.isValidMobileNumber(mobileNumber);
    if (!result) {
      state = const SignUpState.mobileNumberError('SU_subtitle_error_text');
    } else {
      state = const SignUpState.mobileNumberError('');
    }
    return result;
  }

  bool isValidAgentId(String agentId) {
    bool result = _signupUseCase.isValidAgentId(agentId);
    if (!result) {
      state = const SignUpState.agentIdError('SU_agent_id_error_text');
    } else {
      state = const SignUpState.agentIdError('');
    }
    return result;
  }





  bool isValidPaymentMode(String paymentMode) {
    bool result = _signupUseCase.isValidPaymentMode(paymentMode);
    if (!result) {
      state = const SignUpState.paymentModeError('SU_telco_error');
    } else {
      state = const SignUpState.paymentModeError('');
    }
    return result;
  }

  Future<void> continueToOtp(String nidaNumber, String mobileNumber) async {
    await _signupUseCase.saveDetails(
        nidaNumber, '+255' + mobileNumber.replaceAll(" ", ""));
  }

  void navigateToTermsCondition() {
    _navigationHandler.navigateToTermsCondtionsScreen();
  }

  void setPaymentMode(Datum paymentMode) {
    state = SignUpState.onPaymentModeChoosen(paymentMode);
    _signupUseCase.saveTelcoPartner(paymentMode.name!);
  }

  Future getPaymentMode() async {
    var response = await _signupUseCase.getPaymentMode((p0) => null);
    if (response?.status == true) {
      return response?.data;
    } else {
      return [];
    }
  }

  Future<String> getAgentType() async {
    return await _signupUseCase.getAgentType();
  }
}
