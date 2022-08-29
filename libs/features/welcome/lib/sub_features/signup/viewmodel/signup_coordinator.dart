import 'dart:developer';

import 'package:core/logging/logger.dart';
import 'package:shared_data_models/signup/sign_up_type.dart';
import 'package:task_manager/base_classes/base_view_model.dart';
import 'package:welcome/sub_features/signup/state/signup_state.dart';
import 'package:welcome/sub_features/signup/viewmodel/signup_usecase.dart';

import '../../../data_model/sign_up_arguments.dart';
import '../../../navigation_handler/welcome_navigation_handler.dart';
import 'package:config/Config.dart';

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

    var response = await _signupUseCase.callJWTToken((p0) => null);
    if (response?.status == true) {
      state = const SignUpState.initialState();
    } else {
      state = const SignUpState.initialState();

      print(response?.message);
    }
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
          _navigationHandler.navigateToOtpScreenCustomerSignUp(
              signUpArguments.userType, mobileNumber,
              userId: response.data?.customerId.toString());
        } else {
          state = const SignUpState.initialState();
          state = SignUpState.mobileNumberError(response.message!);
        }
      } else if (signUpArguments.signupType == SignupType.resetPasscodeAgent) {
        _navigationHandler.navigateToOtpScreenAgentResetPasscode(
            signUpArguments.userType, agentId, mobileNumber);
      } else
      if (signUpArguments.signupType == SignupType.resetPasscodeCustomer) {
        _navigationHandler.navigateToOtpScreenAgentResetPasscode(
            signUpArguments.userType, agentId, mobileNumber);
      } else if (signUpArguments.signupType == SignupType.agentSignUp) {
        state = const SignUpState.loadingState();
        var agentResponse =
        await _signupUseCase.signUpAgent(nindaNumber, agentId, (p0) => null);
        if (agentResponse?.status == true) {
          await _signupUseCase.saveAgentDetails(nindaNumber, agentId);
          state = const SignUpState.initialState();
          _navigationHandler
              .navigateToAgentDetailScreen(signUpArguments.userType);
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
          state = SignUpState.mobileNumberError(response.message!);
        }
        if (signUpArguments.signupType == SignupType.customerSignUp) {
          state = const SignUpState.loadingState();
          var response = await _signupUseCase.signUp(
              nindaNumber.replaceAll("-", ""), mobileNumber.trim(), (
              p0) => null);
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
            state = SignUpState.mobileNumberError(response.message!);
          }
        } else
        if (signUpArguments.signupType == SignupType.resetPasscodeAgent) {
          var agentDetailResponse = await _signupUseCase.getAgentDetail(
              agentId, nindaNumber.replaceAll("-", ""), (p0) => null);
          if (agentDetailResponse?.status == true) {
            _navigationHandler
                .navigateToOtpScreenAgentResetPasscode(
                signUpArguments.userType, agentDetailResponse!.data!.y9AgentId!,
                agentDetailResponse.data!.mobileNo!);
          } else {
            state =
                SignUpState.mobileNumberError(agentDetailResponse!.message!);
            CrayonPaymentLogger.logError(agentDetailResponse.message!);
          }
        } else
        if (signUpArguments.signupType == SignupType.resetPasscodeCustomer) {
          var detailResponse = await _signupUseCase.getCustomerDetails(
              nindaNumber, mobileNumber, (p0) => null);
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
          var agentResponse =
          await _signupUseCase.signUpAgent(nindaNumber, agentId, (p0) => null);
          if (agentResponse?.status == true) {
            await _signupUseCase.saveAgentDetails(nindaNumber, agentId);
            state = const SignUpState.initialState();
            _navigationHandler
                .navigateToAgentDetailScreen(signUpArguments.userType);
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
            state = SignUpState.mobileNumberError(response.message!);
          }
        }
      }
    } catch (e) {
      state = const SignUpState.initialState();
    }
  }


    Future navigateDestination(SignUpArguments signUpArguments,
        String mobileNumber) async {
      if (signUpArguments.signupType == SignupType.customerSignUp) {
        _navigationHandler.navigateToOtpScreenCustomerSignUp(
            signUpArguments.userType, mobileNumber);
      } else if (signUpArguments.signupType == SignupType.resetPasscodeAgent) {
        // _navigationHandler
        //     .navigateToOtpScreenAgentResetPasscode(signUpArguments.userType);
      } else
      if (signUpArguments.signupType == SignupType.resetPasscodeCustomer) {
        // _navigationHandler
        //     .navigateToOtpScreenAgentResetPasscode(signUpArguments.userType);
      } else if (signUpArguments.signupType == SignupType.agentSignUp) {
        _navigationHandler.navigateToAgentDetailScreen(
            signUpArguments.userType);
      } else if (signUpArguments.signupType ==
          SignupType.agentAidedCustomerOnBoarding) {
        _navigationHandler.navigateToOtpScreenCustomerSignUp(
            signUpArguments.userType, mobileNumber);
      }
    }

    bool _validateForm(String nidaNo, String mobNumber, String agentId,
        UserType userType) {
      var agentID = agentId.isNotEmpty;
      var isnidaNumberValid = _signupUseCase.isValidNINDAnumber(nidaNo);
      var ismobileNoValid = _signupUseCase.isValidMobileNumber(mobNumber);
      var _isValid;
      if (userType == UserType.Customer) {
        _isValid = isnidaNumberValid && ismobileNoValid;
      } else {
        _isValid = isnidaNumberValid && agentID;
      }
      return _isValid;
    }

    void validateForm(String nidaNo, String mobNumber, String agentId,
        userType) {
      state = SignUpState.SignUpFormState(
          _validateForm(nidaNo, mobNumber, agentId, userType));
    }

    bool isValidNidaNumber(String nidaNumber) {
      bool result = _signupUseCase.isValidNINDAnumber(nidaNumber);
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

    Future<void> continueToOtp(String nidaNumber, String mobileNumber) async {
      await _signupUseCase.saveDetails(
          nidaNumber, '+255' + mobileNumber.replaceAll(" ", ""));
    }

    void navigateToTermsCondition() {
      _navigationHandler.navigateToTermsCondtionsScreen();
    }
  }