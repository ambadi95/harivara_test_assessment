import 'package:configuremdm/viewmodel/configuremdm_viewmodel.dart';
import 'package:task_manager/base_classes/base_data_provider.dart';
import 'package:task_manager/task_manager_impl.dart';

class ConfigureMdmUseCase extends BaseDataProvider {
  final ConfigureMdmViewModel _configuremdmviewmodel;

  ConfigureMdmUseCase(this._configuremdmviewmodel, TaskManager taskManager)
      : super(taskManager);

  Future<String> getAgentName() async {
    return await getValueFromSecureStorage('agentName', defaultValue: '');
  }
}
