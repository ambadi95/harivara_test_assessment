import 'package:config/Config.dart';
import 'package:settings/view_model/settings_usecase.dart';
import 'package:task_manager/base_classes/base_view_model.dart';
import 'package:termscondition/termscondition/state/termscondition_state.dart';
import 'package:termscondition/termscondition/view_model/termscondition_usecase.dart';

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
}
