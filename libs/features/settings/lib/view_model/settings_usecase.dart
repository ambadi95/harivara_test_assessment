import 'package:settings/view_model/settings_viewmodel.dart';
import 'package:task_manager/base_classes/base_data_provider.dart';
import 'package:task_manager/task_manager_impl.dart';

class SettingsUseCase extends BaseDataProvider{
  final SettingsViewModel _settingsViewModel;
  SettingsUseCase(this._settingsViewModel, TaskManager taskManager): super(taskManager);

}