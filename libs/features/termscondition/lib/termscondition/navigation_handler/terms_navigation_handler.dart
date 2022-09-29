import 'package:config/Config.dart';
import 'package:core/navigation/navigation_manager.dart';
import 'package:core/navigation/navigation_type.dart';
import 'package:shared_data_models/passcode/passcode_screen_args.dart';
import 'package:widget_library/helpers/error/helper/error_helper.dart';
import 'package:welcome/sub_features/details/view/details.dart';
import 'package:welcome/data_model/agent_detail_arguments.dart';
import 'package:welcome/sub_features/agent_details/view/agent_details.dart';
import 'package:shared_data_models/kyc/agent_detail_screen_type.dart';
import 'package:shared_data_models/passcode/passcode_verification_type.dart';
import 'package:passcode/sub_features/passcode/view/passcode.dart';

class TermsConditionNavigationHandler with ErrorHandler {
  final NavigationManager _navigationManager;

  TermsConditionNavigationHandler(this._navigationManager);

  Future<void> goBack() async {
    _navigationManager.goBack();
  }

  Future<void> navigateToDetailScreen(UserType userType) async {
    var argument = userType;
    _navigationManager.navigateTo(
        DetailsScreen.viewPath, const NavigationType.replace(),
        arguments: argument);
  }

  Future<void> navigateToAgentDetailScreen(UserType userType) async {
    var arguments = AgentDetailScreenArguments('DV_title_agent', 'DV_subtitle',
        AgentDetailScreenType.Signup, userType, true);
    await _navigationManager.navigateTo(
        AgentDetailsScreen.viewPath, const NavigationType.push(),
        arguments: arguments);
  }

  Future<void> openForNewPasscodeAgentCustomer(UserType userType) async {
    var arguments = PasscodeScreenArgs(
      'PC_create_passcode',
      'PC_passcode_message',
      'homemodule/CrayonHomeScreen',
      false,
      3,
      PassCodeVerificationType.create,
      false,
      '',
      userType,
    );

    _navigationManager.navigateTo(
      CrayonPasscodeScreen.viewPath,
      NavigationType.push(),
      preventDuplicates: false,
      arguments: arguments,
    );
  }
}
