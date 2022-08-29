import 'package:config/Colors.dart';
import 'package:config/Config.dart';
import 'package:config/Styles.dart';
import 'package:core/mobile_core.dart';
import 'package:core/view/analytics_state_notifier.dart';
import 'package:flutter/material.dart';
import 'package:shared_data_models/device_option/device_option_args.dart';

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
    var response = await _kycCreditUseCase.callKycCheck('',
            (p0) => null);
    if (response?.status == true) {
      state = KycCreditState.ready(context: context,isLoading:false );
    } else {
      state = KycCreditState.ready(context: context,isLoading:false,error: response!.message! );
      _showSnackBar(context,response.message!);

      callCreditCheck(context);
      print(response.message);
    }
  }

  //call credit check
  Future callCreditCheck(BuildContext context
      ) async {
      state = KycCreditState.ready(context: context,isLoading:true);
    var response = await _kycCreditUseCase.callCreditCheck('',
            (p0) => null);
    if (response?.status == true) {
      state = KycCreditState.ready(context: context,isLoading:false );
    } else {
      state = KycCreditState.ready(context: context,isLoading:false,error: response!.message! );
      _showSnackBar(context,response.message!);

      print(response.message);
    }
  }
  void _showSnackBar(BuildContext context, String errorMessage) {
    final showMessage = ScaffoldMessenger.of(context);
    showMessage.showSnackBar(
      SnackBar(
        backgroundColor: PRIMARY_COLOR,
        key: const Key('Detail_Screen_Error_SnackBar'),
        content: Text(
          errorMessage,
          key:const  Key('Text'),
          style: label_input_error_white_style,
        ),
        duration: const Duration(seconds: 4),
      ),
    );
  }
  void goBack() async {
    _navigationHandler.goBack();
  }

  void navigateToDeviceOption(bool isEnrolled, UserType userType) async {
    var argument = DeviceOptionArgs(isEnrolled, '', userType);
    await _navigationHandler.navigateToDeviceOption(argument);
  }
}
