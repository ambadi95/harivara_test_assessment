import 'package:core/navigation/navigation_manager.dart';
import 'package:widget_library/helpers/error/helper/error_helper.dart';

class SettingsNavigationHandler with ErrorHandler{
  final NavigationManager _navigationManager;
  SettingsNavigationHandler(this._navigationManager);

  Future<void> goBack() async {
    _navigationManager.goBack();
  }

}