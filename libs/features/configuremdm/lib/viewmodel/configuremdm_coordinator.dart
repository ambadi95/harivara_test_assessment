import 'package:configuremdm/state/configuremdm_state.dart';
import 'package:core/view/analytics_state_notifier.dart';
import 'package:flutter/material.dart';

import '../navigation_handler/configuremdm_navigation_handler.dart';
import 'configuremdm_usecase.dart';
import 'package:get/get.dart';
import 'package:widget_library/bottom_sheet/alert_bottom_sheet.dart';

class ConfigureMdmCoordinator
    extends AnalyticsStateNotifier<ConfigureMdmState> {
  final ConfigureMdmNavigationHandler _navigationHandler;
  final ConfigureMdmUseCase _configuremdmUseCase;

  ConfigureMdmCoordinator(
    this._navigationHandler,
    this._configuremdmUseCase,
  ) : super(const ConfigureMdmState.initialState());

  void initialiseState(
    BuildContext context,
  ) async {
    state =
        ConfigureMdmState.ready(context: context, error: "", isLoading: false);
  }


  void configureMdmSuccessFulScreen(){
    _navigationHandler.navigateToConfigureMdmSuccessScreen();
  }

  void successFulScreen(){
    _navigationHandler.navigateToSuccessScreen();
  }


  Future callMdmRegistration(String imei) async {
    var response = await _configuremdmUseCase.mdmRegistration(imei, (p0) => null);
    if (response?.status == true) {
     
    } else {

      _showAlertForErrorMessage(response!.message!);
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

  void goBack() async {
    _navigationHandler.goBack();
  }

}
