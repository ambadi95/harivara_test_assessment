import 'package:shared_data_models/passcode/passcode_request.dart';
import 'package:shared_data_models/signup/create_response.dart';

abstract class IUserClient {
  Future<dynamic> getUserInformation(
    Function(String) onErrorCallback,
  );

  Future<dynamic> getKycUserInformation(
    Function(String) onErrorCallback,
  );

  Future<dynamic> createUser(
    dynamic request,
    Function(String) onErrorCallback,
  );

  Future<CreateResponse?> login(
    PasscodeRequest passcodeRequest, [
    Function(String)? onErrorCallback,
  ]);

  Future<bool> signOut(
    String mobileNumber,
    bool Function(String) onErrorCallback,
  );
}
