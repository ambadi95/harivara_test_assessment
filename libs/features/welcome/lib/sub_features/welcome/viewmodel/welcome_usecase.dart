import 'package:shared_data_models/agent_onboard/agent_details/response/agent_details_response.dart';
import 'package:task_manager/base_classes/base_data_provider.dart';
import 'package:task_manager/task.dart';
import 'package:task_manager/task_manager_impl.dart';
import 'package:welcome/sub_features/welcome/service/perference_service.dart';
import 'package:shared_data_models/preference/preference_response.dart';
import '../../../welcome_module.dart';
import 'welcome_view_model.dart';

class WelcomeUseCase extends BaseDataProvider {
  final WelcomeViewModel _welcomeViewModel;
  WelcomeUseCase(this._welcomeViewModel, TaskManager taskManager)
      : super(taskManager);

  Future<void> saveLocale(String currentLocale) async {
    await setValueToStorage({'current_locale': currentLocale});
  }

  Future<String> getCustomerId() async {
    return await getValueFromSecureStorage('customerId', defaultValue: '');
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

  Future<PreferenceResponse?> setPreferences(String lang,
      Function(String) onErrorCallback) async {
    String customerID = await getCustomerId();
    return await executeApiRequest<PreferenceResponse?>(
        taskType: TaskType.DATA_OPERATION,
        taskSubType: TaskSubType.REST,
        moduleIdentifier: WelcomeModule.moduleIdentifier,
        requestData: {"customerId": customerID,
          "lang" : lang
        },
        serviceIdentifier: IPreferencesService.preferencesIdentifier,
        onError: onErrorCallback,
        modelBuilderCallback: (responseData) {
          final data = responseData;
          return PreferenceResponse.fromMap(data);
        });
  }
}
