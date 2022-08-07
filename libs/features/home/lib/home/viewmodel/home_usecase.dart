import 'package:task_manager/base_classes/base_data_provider.dart';
import 'package:task_manager/task_manager_impl.dart';

import 'home_view_model.dart';

class HomeUserCase extends BaseDataProvider {
  final HomeViewModel customHomeViewModel;
  HomeUserCase(this.customHomeViewModel, TaskManager taskManager)
      : super(taskManager);

  Future<String> getAgentId() async {
    return await getValueFromSecureStorage('agentId', defaultValue: '');
  }

  Future<String> getAgentName() async {
    return await getValueFromSecureStorage('agentName', defaultValue: '');
  }
}
