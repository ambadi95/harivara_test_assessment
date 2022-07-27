
import 'package:task_manager/base_classes/base_data_provider.dart';
import 'package:task_manager/task_manager_impl.dart';

import 'agent_details_view_model.dart';

class AgentDetailsUseCase extends BaseDataProvider{
  final AgentDetailsViewModel agentDetailsViewModel;
  AgentDetailsUseCase(this.agentDetailsViewModel ,TaskManager taskManager) : super(taskManager);

  bool isValidName(String name){
    return agentDetailsViewModel.isValidName(name);
  }

  bool isValidEmail(String emailId){
    return agentDetailsViewModel.isValidEmailId(emailId);
  }

  bool isValidPoBox(String poBox){
    return agentDetailsViewModel.isValidPoBox(poBox);
  }

  Future<String> getMobileNumber() async {
    return await getValueFromStorage('mobileNumber', defaultValue: '');
  }

}