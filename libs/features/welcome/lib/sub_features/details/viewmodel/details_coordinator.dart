

import 'package:task_manager/base_classes/base_view_model.dart';
import 'package:welcome/sub_features/details/state/details_state.dart';
import 'package:welcome/sub_features/details/viewmodel/details_usecase.dart';

import '../../../navigation_handler/welcome_navigation_handler.dart';

class DetailsCoordinator extends BaseViewModel<DetailsState>{
  final DetailsUseCase _detailsUseCase;
  final WelcomeNavigationHandler _navigationHandler;

  DetailsCoordinator( this._navigationHandler, this._detailsUseCase,) : super(const DetailsState.initialState());

  void goBack() async {
    _navigationHandler.goBack();
  }

}