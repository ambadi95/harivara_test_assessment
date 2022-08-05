import 'package:task_manager/base_classes/base_data_provider.dart';
import 'package:task_manager/task_manager_impl.dart';

import 'welcome_back_view_model.dart';

class WelcomeBackUseCase extends BaseDataProvider {
  final WelcomeBackViewModel _welcomeBackViewModel;
  WelcomeBackUseCase(this._welcomeBackViewModel, TaskManager taskManager)
      : super(taskManager);

  Future<void> saveLocale(String currentLocale) async {
    await setValueToStorage({'current_locale': currentLocale});
  }

  Future<String> getLocale() async {
    String defaultLocale = 'en';
    String savedLocale =
        await getValueFromStorage('current_locale', defaultValue: '');
    if (savedLocale.isEmpty) {
      savedLocale = defaultLocale;
    }
    return savedLocale;
  }
}
