
import 'package:task_manager/task_manager.dart';

import '../service/otp_service.dart';

class OtpApiResolver extends TaskResolver {
  final IOtpService _otpService;

  OtpApiResolver(this._otpService);

  @override
  Future execute(String identifier, Map<String, dynamic> requestData) {
    switch (identifier) {
      case IOtpService.otpIdentifier:
        return _otpService.otpGen(
          requestData,
        );
      default:
        throw UnimplementedError();
    }
  }
}
