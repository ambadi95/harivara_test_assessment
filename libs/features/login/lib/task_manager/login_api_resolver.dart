
import 'package:task_manager/task_manager.dart';
import '../service/login_service.dart';




class LoginApiResolver extends TaskResolver {
  final ILoginService _loginService;

  LoginApiResolver(this._loginService);

  @override
  Future execute(String identifier, Map<String, dynamic> requestData) {
    switch (identifier) {
      case ILoginService.loginIdentifier:
        return _loginService.login(
          requestData
        );
      default:
        throw UnimplementedError();
    }
  }
}
