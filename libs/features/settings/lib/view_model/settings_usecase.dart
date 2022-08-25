import 'package:settings/view_model/settings_viewmodel.dart';
import 'package:task_manager/base_classes/base_data_provider.dart';
import 'package:task_manager/cache_task_resolver.dart';
import 'package:task_manager/task.dart';
import 'package:task_manager/task_manager_impl.dart';

class SettingsUseCase extends BaseDataProvider {
  final SettingsViewModel _settingsViewModel;
  final CacheTaskResolver _cacheTaskResolver;
  SettingsUseCase(
      this._settingsViewModel, this._cacheTaskResolver, TaskManager taskManager)
      : super(taskManager);

  Future<String> getLocale() async {
    String defaultLocale = 'en';
    String savedLocale =
    await getValueFromStorage('current_locale', defaultValue: '');
    if (savedLocale.isEmpty) {
      savedLocale = defaultLocale;
    }
    return savedLocale;
  }

  Future<void> saveLocale(String currentLocale) async {
    await setValueToStorage({'current_locale': currentLocale});
  }

  Future logout() async {
     String currentLocale = await getLocale();
    _cacheTaskResolver.execute("", {CACHE_TYPE: TaskManagerCacheType.values});
    await saveLocale(currentLocale);
  }
}
