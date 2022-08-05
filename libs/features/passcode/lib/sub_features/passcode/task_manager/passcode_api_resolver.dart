import 'package:task_manager/task_manager.dart';

import '../service/passcode_service.dart';

class PasscodeApiResolver extends TaskResolver {
  final IPasscodeService _passcodeService;

  PasscodeApiResolver(this._passcodeService);

  @override
  Future execute(String identifier, Map<String, dynamic> requestData) {
    switch (identifier) {
      case IPasscodeService.passcodeIdentifier:
        return _passcodeService.savePasscode(
          requestData,
        );
      case IPasscodeService.resetPasscodeIdentifier:
        return _passcodeService.resetPasscode(
          requestData,
        );
      default:
        throw UnimplementedError();
    }
  }
}
