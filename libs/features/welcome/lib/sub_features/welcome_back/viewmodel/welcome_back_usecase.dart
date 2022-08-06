import 'package:login/login_module.dart';
import 'package:login/service/login_service.dart';
import 'package:shared_data_models/welcome/signin/request/sign_in_request.dart';
import 'package:shared_data_models/welcome/signin/response/customer_sign_in_response.dart';
import 'package:task_manager/base_classes/base_data_provider.dart';
import 'package:task_manager/task.dart';
import 'package:task_manager/task_manager_impl.dart';
import 'package:welcome/welcome_module.dart';

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

  Future<String> getMobileNumber() async {
    return await getValueFromSecureStorage('mobileNumber', defaultValue: '');
  }

  Future<CustomerSignInResponse?> login(String mobileNumber, String passcode,
      Function(String) onErrorCallback) async {
    SignInRequest signInRequest = SignInRequest(
        mobileNumber: mobileNumber,
        passcode: passcode
    );
    return await executeApiRequest<CustomerSignInResponse?>(
        taskType: TaskType.DATA_OPERATION,
        taskSubType: TaskSubType.REST,
        moduleIdentifier: LoginModule.moduleIdentifier,
        requestData: signInRequest.toJson(),
        serviceIdentifier: ILoginService.loginIdentifier,
        onError: onErrorCallback,
        modelBuilderCallback: (responseData) {
          final data = responseData;
          return CustomerSignInResponse.fromJson(data);
        });
  }

}

