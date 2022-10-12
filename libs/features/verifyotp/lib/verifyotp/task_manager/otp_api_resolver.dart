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
      case IOtpService.otpVerifyIdentifier:
        return _otpService.otpVerify(
          requestData,
        );
      case IOtpService.otpGenCustomerByAgentIdentifier:
        return _otpService.otpGenCustomerByAgent(
          requestData,
        );
      case IOtpService.otpVerifyCustomerByAgentIdentifier:
        return _otpService.otpVerifyCustomerByAgent(
          requestData,
        );
      case IOtpService.workFlowCustomerByAgentIdentifier:
        return _otpService.workFlowCustomerByAgent(
          requestData['customerId'],
        );
      case IOtpService.customerDetailsIdentifier:
        return _otpService
            .getCustomerDetailByMobileNo(requestData['mobileNumber']);
      case IOtpService.updateCustomerDetailsIdentifier:
        return _otpService.updateCustomerDetailsOnBoarding(requestData);
      default:
        throw UnimplementedError();
    }
  }
}
