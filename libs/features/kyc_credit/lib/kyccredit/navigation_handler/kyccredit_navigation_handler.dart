import 'package:core/navigation/navigation_manager.dart';
import 'package:widget_library/helpers/error/helper/error_helper.dart';

class KycCreditNavigationHandler with ErrorHandler {
  final NavigationManager _navigationManager;

  KycCreditNavigationHandler(this._navigationManager);

  Future<void> goBack() async {
    _navigationManager.goBack();
  }
}
