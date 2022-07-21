
import 'package:passcode/sub_features/passcode/view_model/passcode_viewmodel.dart';

import 'package:task_manager/base_classes/base_data_provider.dart';
import 'package:task_manager/task_manager_impl.dart';
import 'package:widget_library/keypad/keypad_button_type.dart';

class PasscodeUseCase extends BaseDataProvider{
  final PassCodeViewModel _passCodeViewModel;

  PasscodeUseCase(this._passCodeViewModel, TaskManager taskManager) : super(taskManager);

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

  Future<void> savePassCode(String passCode) async {
    return await setValueToSecureStorage({"PASSCODE": passCode});
  }


}
