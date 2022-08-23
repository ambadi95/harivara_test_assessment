import 'package:core/navigation/navigation_manager.dart';
import 'package:core/navigation/navigation_type.dart';
import 'package:crayon_payment_customer/home/view/home_screen.dart';
import 'package:kyc/view/kyc_credit_screen.dart';
import 'package:shared_data_models/kyc/kyc_data_model.dart';
import 'package:shared_data_models/kyc/kyc_screen_args.dart';
import 'package:shared_data_models/kyc/kyc_type.dart';
import 'package:widget_library/helpers/error/helper/error_helper.dart';

class KycCreditMainNavigationHandler with ErrorHandler {
  final NavigationManager _navigationManager;

  KycCreditMainNavigationHandler(this._navigationManager);

  Future<void> navigateToWelcomeBack() async {
    await _navigationManager.navigateTo(
      CrayonCustomerHomeScreen.viewPath,
      NavigationType.push(),
    );
  }

  Future<void> navigateToCreditCheck() async {
    var arguments = KycScreenArgs(
      KycFieldType.KYC_VALIDATION,
      "",
      "",
      "",
      "",
      [KYCDataModel(title: "", isSelected: false)],
    );

    await _navigationManager.navigateTo(
      KycCreditScreen.viewPath,
      const NavigationType.push(),
      arguments: arguments,
    );
  }
}
