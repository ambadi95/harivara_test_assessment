import 'package:core/navigation/navigation_manager.dart';

class CrayonPaymentBottomSheetNavigationHandler {
  final NavigationManager _navigationManager;

  CrayonPaymentBottomSheetNavigationHandler(this._navigationManager);

  bool get isBottomSheetOpen => _navigationManager.isBottomSheetOpen;

  void navigateBack() {
    _navigationManager.goBack();
  }
}
