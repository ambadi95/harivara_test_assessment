

import 'package:task_manager/base_classes/base_view_model.dart';

import '../navigation_handler/home_navigation_handler.dart';
import '../state/home_screen_state.dart';
import 'home_usecase.dart';


class CustomerHomeCoordinator extends BaseViewModel<CustomerHomeScreenState>{
  final CustomerHomeUserCase _customerHomeUseCase;
  final CustomerHomeNavigationHandler _navigationHandler;
  CustomerHomeCoordinator(this._navigationHandler, this._customerHomeUseCase) : super(const CustomerHomeScreenState.initialState());

  void goBack() async {
    _navigationHandler.goBack();
  }





}