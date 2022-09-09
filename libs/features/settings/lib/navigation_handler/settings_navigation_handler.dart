import 'package:agent_nearby/view/agent_nearby_screen.dart';
import 'package:config/Colors.dart';
import 'package:core/navigation/navigation_manager.dart';
import 'package:core/navigation/navigation_type.dart';
import 'package:core/sheets/data_model/button_options.dart';
import 'package:shared_data_models/kyc/agent_detail_screen_type.dart';
import 'package:shared_data_models/signup/sign_up_type.dart';
import 'package:shared_data_models/termscondition_faq_screen_args/termscondition_faq_screen_args.dart';
import 'package:welcome/data_model/agent_detail_arguments.dart';
import 'package:welcome/data_model/sign_up_arguments.dart';
import 'package:welcome/sub_features/agent_details/view/agent_details.dart';
import 'package:welcome/sub_features/customer_profile_details/view/customer_details_screen.dart';
import 'package:welcome/sub_features/details/view/details.dart';
import 'package:welcome/sub_features/signup/view/signup.dart';
import 'package:welcome/sub_features/welcome/data_model/welcome_model.dart';
import 'package:welcome/sub_features/welcome/view/welcome_screen.dart';
import 'package:widget_library/helpers/error/helper/error_helper.dart';
import 'package:widget_library/icons/crayon_payment_bottom_sheet_icon.dart';
import 'package:core/sheets/state/crayon_payment_bottom_sheet_state.dart';
import 'package:welcome/sub_features/app_language/view/app_language.dart';
import 'package:config/Config.dart';
import 'package:termscondition/termscondition/view/terms_condition_view.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingsNavigationHandler with ErrorHandler {
  final NavigationManager _navigationManager;

  SettingsNavigationHandler(this._navigationManager);

  Future<void> goBack() async {
    _navigationManager.goBack();
  }

  Future<void> navigateToResetPasscode(UserType userType) async {
    var arguments = SignUpArguments(
      'SU_update_passcode',
      'SU_update_subtitle',
      userType,
      userType == UserType.Agent
          ? SignupType.resetPasscodeAgent
          : SignupType.resetPasscodeCustomer,
      false,
    );
    await _navigationManager.navigateTo(
        SignUp.viewPath, const NavigationType.push(),
        arguments: arguments);
  }

  Future<void> navigateToAgentChangeLanguageBottomSheet(UserType userType) async {
    final CrayonPaymentBottomSheetIcon icon =
        CrayonPaymentBottomSheetAppLanguageIconIcon();
    final CrayonPaymentBottomSheetState infoState =
        CrayonPaymentBottomSheetState.changeLanguage(
      widgetOptions: [
         AppLanguage(userType: userType),
      ],
      buttonOptions: [
        ButtonOptions(Black, 'Continue', () => {goBack()}, false),
      ],
      disableCloseButton: true,
      bottomSheetIcon: icon,
      title: 'App Language',
    );

    _navigationManager.navigateTo(
      'bottomSheet/crayonPaymentBottomSheet',
      const NavigationType.bottomSheet(),
      arguments: infoState,
    );
  }

  Future<void> navigateToAgentDetailScreen() async {
    var arguments = AgentDetailScreenArguments('DV_profile', 'DV_subtitle',
        AgentDetailScreenType.UpdateProfile, UserType.Agent, false);
    await _navigationManager.navigateTo(
        AgentDetailsScreen.viewPath, const NavigationType.push(),
        arguments: arguments);
  }

  Future<void> navigateToCustomerDetailScreen() async {
    var arguments = UserType.Customer;
    await _navigationManager.navigateTo(
        CustomerDetailsScreen.viewPath, const NavigationType.push(),
        arguments: arguments);
  }

  Future<void> signOut(UserType userType) async {
    var arguments = WelcomeScreenArgs('', '', userType, false);
    _navigationManager.navigateTo(
        CrayonWelcomScreen.viewPath, const NavigationType.replace(),
        arguments: arguments);
  }

  Future<void> navigateToTermsCondtionsScreen(bool isFaq) async {
    var arguments = TermsConditionAndFaqScreenArgs(isFAQ: isFaq);
    _navigationManager.navigateTo(
        CrayonTermsCondition.viewPath, const NavigationType.push(),
        arguments: arguments);
  }

  Future<void> navigateToAgentNearBy() async {
    await _navigationManager.navigateTo(
      AgentNearBy.viewPath,
      const NavigationType.push(),
    );
  }

  void navigateToTermsCondition() async {
    var uri = Uri.parse(y9TermsCondition);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch ${uri.toString()}';
    }
  }
}
