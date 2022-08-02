import 'package:config/Colors.dart';
import 'package:core/navigation/navigation_manager.dart';
import 'package:core/navigation/navigation_type.dart';
import 'package:core/sheets/data_model/button_options.dart';
import 'package:shared_data_models/signup/sign_up_type.dart';
import 'package:welcome/data_model/sign_up_arguments.dart';
import 'package:welcome/sub_features/signup/view/signup.dart';
import 'package:widget_library/helpers/error/helper/error_helper.dart';
import 'package:widget_library/icons/crayon_payment_bottom_sheet_icon.dart';
import 'package:core/sheets/state/crayon_payment_bottom_sheet_state.dart';
import 'package:welcome/sub_features/app_language/view/app_language.dart';

class SettingsNavigationHandler with ErrorHandler{
  final NavigationManager _navigationManager;
  SettingsNavigationHandler(this._navigationManager);

  Future<void> goBack() async {
    _navigationManager.goBack();
  }

  Future<void> navigateToSignUpScreen() async {

      var arguments = SignUpArguments(
        'SU_update_passcode',
        'SU_update_subtitle',
        'Agent',
        SignupType.resetPasscodeAgent,
        false,
      );
      await _navigationManager.navigateTo(
          SignUp.viewPath, const NavigationType.push(),
          arguments: arguments);
  }

  Future<void> navigateToAgentChangeLanguageBottomSheet() async {
    final CrayonPaymentBottomSheetIcon icon = CrayonPaymentBottomSheetAppLanguageIconIcon();
    final CrayonPaymentBottomSheetState infoState = CrayonPaymentBottomSheetState.changeLanguage(
      widgetOptions: [
       const AppLanguage(),
      ],
        buttonOptions: [
          ButtonOptions(Black,'Continue', ()=>{goBack()},false),
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

}