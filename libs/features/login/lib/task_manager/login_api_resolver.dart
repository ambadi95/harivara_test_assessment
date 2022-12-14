import 'package:task_manager/task_manager.dart';
import '../service/login_service.dart';

class LoginApiResolver extends TaskResolver {
  final ILoginService _loginService;

  LoginApiResolver(this._loginService);

  @override
  Future execute(String identifier, Map<String, dynamic> requestData) {
    switch (identifier) {
      case ILoginService.jwtIdentifier:
        return _loginService.jwttoken(requestData);
      case ILoginService.loginIdentifier:
        return _loginService.login(requestData);
      case ILoginService.loginAgentIdentifier:
        return _loginService.loginAgent(requestData);
      case ILoginService.agentDetailIdentifier:
        return _loginService.getAgentDetails(
            requestData['agentId'], requestData['mobileNumber']);
      case ILoginService.checkPasscodeIdentifier:
        return _loginService.checkPasscode(requestData['mobileNumber']);
      case ILoginService.customerDetailsIdentifier:
        return _loginService.getCustomerDetailByMobileNo(requestData['mobileNumber']);
      default:
        throw UnimplementedError();
    }
  }
}
