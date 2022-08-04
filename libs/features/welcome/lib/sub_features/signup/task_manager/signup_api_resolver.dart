
import 'package:task_manager/task_manager.dart';

import '../service/signup_service.dart';

class SignupApiResolver extends TaskResolver {
  final ISignupService _signupService;

  SignupApiResolver(this._signupService);

  @override
  Future execute(String identifier, Map<String, dynamic> requestData) {
    switch (identifier) {
      case ISignupService.signupIdentifier:
        return _signupService.signup(
          requestData['nindaNumber'] as String,
          requestData['phoneNo'] as String,
        );
      default:
        throw UnimplementedError();
    }
  }
}
