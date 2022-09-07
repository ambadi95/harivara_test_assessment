import 'package:splash/splash/view_model/splash_viewmodel.dart';
import 'package:task_manager/base_classes/base_data_provider.dart';
import 'package:task_manager/task_manager_impl.dart';

class SplashUseCase extends BaseDataProvider {
  final SplashViewModel _splashViewModel;

  SplashUseCase(this._splashViewModel, TaskManager taskManager)
      : super(taskManager);

  Future<String> getMobileNumber() async {
    return await getValueFromSecureStorage('mobileNumber', defaultValue: '');
  }
  Future<String> getLocale() async {
    String savedLocale =
    await getValueFromStorage('current_locale', defaultValue: '');
    if (savedLocale.isEmpty) {
      savedLocale = '';
    }
    return savedLocale;
  }

  Future<void> saveLocale(String currentLocale) async {
    await setValueToStorage({'current_locale': currentLocale});
  }

  Future<String> getOnBoardStatus() async {
    return await getValueFromSecureStorage('OnBoardStatus', defaultValue: '');
  }
}
