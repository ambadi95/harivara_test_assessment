import 'package:core/navigation/navigation_manager.dart';
import 'package:widget_library/helpers/error/helper/error_helper.dart';

class CustomerHomeNavigationHandler with ErrorHandler{
  final NavigationManager _navigationManager;

  CustomerHomeNavigationHandler(this._navigationManager);

  Future<void> goBack() async {
    _navigationManager.goBack();
  }


}