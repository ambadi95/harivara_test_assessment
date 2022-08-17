import 'package:config/Config.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/base_classes/base_view_model.dart';
import 'package:shared_data_models/home/customerCount/customer_count_response/data.dart';
import '../navigation_handler/home_navigation_handler.dart';
import '../state/home_screen_state.dart';
import 'home_usecase.dart';

class HomeCoordinator extends BaseViewModel<HomeScreenState> {
  final HomeUserCase _customerHomeUseCase;
  final HomeNavigationHandler _navigationHandler;
  HomeCoordinator(this._navigationHandler, this._customerHomeUseCase)
      : super(const HomeScreenState.initialState());

  void initialiseState(
      BuildContext context, String error, bool isAgent, bool isLoading) async {
    state = HomeScreenState.ready(
        context: context, error: error, isAgent: isAgent, isLoading: isLoading);
  }

  void navigateToCustomerRegister() {
    _navigationHandler.navigateToSignUpScreen('Customer');
  }

  void goBack() async {
    _navigationHandler.goBack();
  }

  void navigateToSettingsScreen() {
    _navigationHandler.navigateToSettingsScreen();
  }

  Future<String> getAgentId() async {
    String agentId = await _customerHomeUseCase.getAgentId();
    return agentId;
  }

  Future<String> getAgentName() async {
    String agentName = await _customerHomeUseCase.getAgentName();
    return agentName;
  }

  Future<Data> getCustomerCount() async {
    print('jhgsdjahgsdjgsa');
    var response = await _customerHomeUseCase.getCustomerCount((p0) => null);
    if (response?.status == true) {
      print(response);
      return response!.data!;
    } else {
      return const Data(enrolledCustomer: '0', initiatedCustomer: '0');
    }
  }
}
