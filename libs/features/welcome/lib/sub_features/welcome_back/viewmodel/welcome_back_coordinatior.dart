import 'dart:ui';
import 'package:config/Config.dart';
import 'package:core/mobile_core.dart';
import 'package:welcome/sub_features/welcome/state/welcome_screen_state.dart';
import 'package:task_manager/base_classes/base_view_model.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:widget_library/utils/app_utils.dart';

import '../../../navigation_handler/welcome_navigation_handler.dart';
import 'welcome_back_usecase.dart';

class WelcomeBackCoordinator extends BaseViewModel<WelcomeScreenState> {
  final WelcomeNavigationHandler _navigationHandler;
  final WelcomeBackUseCase _welcomeUseCase;

  WelcomeBackCoordinator(
    this._navigationHandler,
    this._welcomeUseCase,
  ) : super(const WelcomeScreenState(
          currentLanguageCode: 'en',
        ));

  void setCurrentLocale(String currentLanguageCode) {
    var currentLocale = Locale(currentLanguageCode);
    Get.updateLocale(currentLocale);
    Intl.defaultLocale = currentLocale.languageCode;
    _welcomeUseCase.saveLocale(currentLanguageCode);
    state = state.copyWith(
      currentLanguageCode: currentLanguageCode,
    );
  }

  Future<void> navigationToDestination(UserType userType) async {
    if (userType == UserType.Customer) {
      _navigationHandler.navigateToCustomerEnrollmentScreen();
    } else {
      _navigationHandler.navigateToAgentHome();
    }
  }

  Future<String> getAgentDetails() async {
    try {
      state = state.copyWith(isLoading: true);
      var response = await _welcomeUseCase.getAgentDetail((p0) => null);
      if (response?.status == true) {
        state = state.copyWith(isLoading: false);
        await _welcomeUseCase.saveAgentMobileNumber(response!.data!.mobileNo!);
        String name = response.data!.firstName! + ' ' + response.data!.lastName!;
        return name;
      } else {
        state = state.copyWith(isLoading: false);
        CrayonPaymentLogger.logError(response!.message!);
        return '';
      }
    }  catch (e) {
      state = state.copyWith(isLoading: false);
      throw e.toString();
    }
  }


  Future agentLogin(String passcode) async {
    try {
      state = state.copyWith(isLoading: true);
      var loginResponse =
          await _welcomeUseCase.loginAgent(passcode, (p0) => null);
      if (loginResponse?.status == true) {
        state = state.copyWith(isLoading: false);
        _navigationHandler.navigateToAgentHome();
      } else {
        state = state.copyWith(isLoading: false);
        state = state.copyWith(error: loginResponse!.message!);
        CrayonPaymentLogger.logError(loginResponse.message!);
      }
    }  catch (e) {
      state = state.copyWith(isLoading: false);

    }
  }

  Future<void> navigateToResetNow(UserType userType) async {
    await _navigationHandler.navigateToResetPasscode(userType);
  }

  Future<String> getUserName() async {
    return await _welcomeUseCase.getAgentName();
  }

  Future<String> getCustomer() async {
    return await _welcomeUseCase.getCustomerName();
  }

  Future<String> getUserId() async {
    return await _welcomeUseCase.getCustomerY9Id();
  }

  void onPasscodeCallback(String passCode, UserType userType) {
    AppUtils.appUtilsInstance.saveUserType(userType);

    if (userType == UserType.Customer) {
      customerLogin(passCode, userType);
    } else {
      agentLogin(passCode);
    }
  }

  Future customerLogin(String passcode, UserType userType) async {
    String mobileNumber = await _welcomeUseCase.getMobileNumber();
    state = state.copyWith(isLoading: true);
    try {

      var response =
          await _welcomeUseCase.login(mobileNumber, passcode, (p0) => null);
      if (response?.status == true) {
        state = state.copyWith(isLoading: false);
        if(UserType.Customer == userType){
          var customerAgentIdResponse = await _welcomeUseCase.getCustomerDetailsByMobileNumber( (p0) => null);
          if(customerAgentIdResponse?.status == true){
            String? customerAgentId = customerAgentIdResponse?.data?.y9AgentId;
            if(customerAgentId != null && customerAgentId.isNotEmpty){
              _navigationHandler.navigateToHome(userType);
            }else{
              _navigationHandler.navigateToCustomerEnrollmentScreen();
            }
          }
        }else{
          _navigationHandler.navigateToHome(userType);

        }
      } else {
        state = state.copyWith(isLoading: false);
        state = state.copyWith(error: response!.message!);
      }
    }  catch (e) {
      state = state.copyWith(isLoading: false);
      print(e.toString());
    }
  }
}
