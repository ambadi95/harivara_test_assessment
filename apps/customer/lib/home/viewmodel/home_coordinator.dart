

import 'package:crayon_payment_customer/home/navigation_handler/home_navigation_handler.dart';
import 'package:crayon_payment_customer/home/state/home_screen_state.dart';
import 'package:crayon_payment_customer/home/viewmodel/home_usecase.dart';
import 'package:task_manager/base_classes/base_view_model.dart';


class CustomerHomeCoordinator extends BaseViewModel<CustomerHomeScreenState>{
  final CustomerHomeUserCase _customerHomeUseCase;
  final CustomerHomeNavigationHandler _navigationHandler;
  CustomerHomeCoordinator(this._navigationHandler, this._customerHomeUseCase) : super(const CustomerHomeScreenState.initialState());

  void goBack() async {
    _navigationHandler.goBack();
  }





}