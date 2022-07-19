import 'package:core/navigation/navigation_manager.dart';
import 'package:widget_library/helpers/error/helper/error_helper.dart';

class WelcomeNavigationHandler with ErrorHandler{
  final NavigationManager _navigationManager;

  WelcomeNavigationHandler(this._navigationManager);
}