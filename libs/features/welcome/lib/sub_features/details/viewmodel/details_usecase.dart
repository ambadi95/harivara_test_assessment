
import 'package:task_manager/base_classes/base_data_provider.dart';
import 'package:task_manager/task_manager_impl.dart';

import 'details_view_model.dart';

class DetailsUseCase extends BaseDataProvider{
  final DetailsViewModel detailsViewModel;
  DetailsUseCase(this.detailsViewModel ,TaskManager taskManager) : super(taskManager);

  bool isValidName(String name){
    return detailsViewModel.isValidName(name);
  }

  bool isValidEmail(String emailId){
    return detailsViewModel.isValidEmailId(emailId);
  }

  bool isValidPoBox(String poBox){
    return detailsViewModel.isValidPoBox(poBox);
  }

  Future<String> getMobileNumber() async {
    return await getValueFromStorage('mobileNumber', defaultValue: '');
  }

}