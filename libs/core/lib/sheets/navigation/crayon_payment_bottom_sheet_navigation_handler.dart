import 'package:core/navigation/navigation_manager.dart';
import 'package:core/navigation/navigation_type.dart';
import 'package:shared_data_models/payments/payments_screen_args.dart';

class CrayonPaymentBottomSheetNavigationHandler {
  final NavigationManager _navigationManager;

  CrayonPaymentBottomSheetNavigationHandler(this._navigationManager);

  bool get isBottomSheetOpen => _navigationManager.isBottomSheetOpen;

  void navigateBack() {
    _navigationManager.goBack();
  }


}
