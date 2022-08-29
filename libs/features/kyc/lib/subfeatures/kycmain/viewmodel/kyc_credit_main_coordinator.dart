import 'package:core/mobile_core.dart';
import 'package:core/view/analytics_state_notifier.dart';
import 'package:flutter/material.dart';
import 'package:crayon_payment_customer/util/app_utils.dart';
import '../navigation_handler/kyc_main_navigation_handler.dart';
import '../state/kyc_credit_main_state.dart';
import 'kyc_credit_main_usecase.dart';

class KycCreditMainCoordinator
    extends AnalyticsStateNotifier<KycCreditMainState> {
  final KycCreditMainNavigationHandler _navigationHandler;
  final KycCreditMainUseCase _kycCreditMainUseCase;

  KycCreditMainCoordinator(
    this._navigationHandler,
    this._kycCreditMainUseCase,
  ) : super(
          const KycCreditMainState.initialState(),
        );

  void initialiseState(
    BuildContext context,
  ) async {
    state =
        KycCreditMainState.ready(context: context, error: "", isLoading: false);
  }

  //call mno consent
  Future callMnoConsent(BuildContext context
      ) async {
    try {
      state = KycCreditMainState.ready(context: context,isLoading:true );
      var response = await _kycCreditMainUseCase.callMnoConsent('',
              (p0) => null);
      if (response?.status == true) {
        state = KycCreditMainState.ready(context: context,isLoading:false );
      } else {
        state = KycCreditMainState.ready(context: context,isLoading:false,error: response!.message! );
        print(response.message);
      }
    } on Exception catch (e) {
      state = KycCreditMainState.ready(context: context,isLoading:true );
      AppUtils.appUtilsInstance.showErrorBottomSheet(
        title: e.toString(),
        onClose: () {goBack();},
      );
    }
  }



  Future<void> navigateToKycCreditAirtel() async {
    await _navigationHandler.navigateToCreditCheck();
  }

  Future<void> navigateToTermsCondtionsScreen() async {
    await _navigationHandler.navigateToTermsCondtionsScreen();
  }

  Future<void> showErrorBottomSheet(
      Widget errorWidget, BuildContext context) async {
    await _navigationHandler.showCheckBoxErrorBottomSheet(errorWidget, context);
  }

  void goBack() async {
    _navigationHandler.goBack();
  }
}
