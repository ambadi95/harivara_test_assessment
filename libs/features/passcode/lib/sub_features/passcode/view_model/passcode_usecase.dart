import 'package:network_manager/auth/auth_manager.dart';
import 'package:passcode/sub_features/passcode/service/passcode_service.dart';
import 'package:passcode/sub_features/passcode/view_model/passcode_viewmodel.dart';
import 'package:shared_data_models/customer_onboard/passcode/request/passcode_request.dart';
import 'package:shared_data_models/customer_onboard/passcode/response/passcode_response.dart';
import 'package:shared_data_models/welcome/signin/request/sign_in_request.dart';
import 'package:shared_data_models/welcome/signin/response/customer_sign_in_response.dart';

import 'package:task_manager/base_classes/base_data_provider.dart';
import 'package:task_manager/task.dart';
import 'package:task_manager/task_manager_impl.dart';
import 'package:widget_library/keypad/keypad_button_type.dart';

import '../../../passcode_module.dart';

class PasscodeUseCase extends BaseDataProvider {
  final PassCodeViewModel _passCodeViewModel;
  final IAuthManager _authManager;

  PasscodeUseCase(this._passCodeViewModel, this._authManager, TaskManager taskManager)
      : super(taskManager);

  String updateCurrentPasscode(
    KeypadButtonType keypadButtonType,
    String previousTotalAmount,
    int cvvLength,
  ) {
    return _passCodeViewModel.updateCurrentPasscode(
      keypadButtonType,
      previousTotalAmount,
      cvvLength,
    );
  }

  Future<String> validateCustomerPasscode(
    String passcode,
  ) async {
    if (!_passCodeViewModel.validPasscode(passcode)) {
      return 'passcode-invalid-error';
    }
    return '';
  }

  Future<void> savePassCodeLocal(String passCode) async {
    return await setValueToSecureStorage({"PASSCODE": passCode});
  }

  Future<String> getCustomerId() async {
    return await getValueFromStorage('customerId', defaultValue: '');
  }

  Future<String> getNumber() async {
    return await getValueFromStorage('mobileNumber', defaultValue: '');
  }

  Future<PasscodeResponse?> savePasscode(
      String passcode, Function(String) onErrorCallback) async {
    String custmerId = await getCustomerId();
    PasscodeRequest passcodeRequest = PasscodeRequest(
        id: int.parse(custmerId), type: 'Customer', passcode: passcode);

    return await executeApiRequest<PasscodeResponse?>(
        taskType: TaskType.DATA_OPERATION,
        taskSubType: TaskSubType.REST,
        moduleIdentifier: PasscodeModule.moduleIdentifier,
        requestData: passcodeRequest.toJson(),
        serviceIdentifier: IPasscodeService.passcodeIdentifier,
        onError: onErrorCallback,
        modelBuilderCallback: (responseData) {
          final data = responseData;
          return PasscodeResponse.fromJson(data);
        });
  }

  Future<CustomerSignInResponse?> login( String passcode,
      Function(String) onErrorCallback) async {
    String mobileNumber = await getNumber();
    SignInRequest signInRequest =
    SignInRequest(mobileNumber: mobileNumber, passcode: passcode);
    return await executeApiRequest<CustomerSignInResponse?>(
        taskType: TaskType.DATA_OPERATION,
        taskSubType: TaskSubType.REST,
        moduleIdentifier: PasscodeModule.moduleIdentifier,
        requestData: signInRequest.toJson(),
        serviceIdentifier: IPasscodeService.loginIdentifier,
        onError: onErrorCallback,
        modelBuilderCallback: (responseData) {
          final data = responseData;
          CustomerSignInResponse customerSignInResponse = CustomerSignInResponse.fromJson(data);
          _authManager.storeTokenInformation(customerSignInResponse.data!.token!, '', '', '');
          return CustomerSignInResponse.fromJson(data);
        });
  }
}
