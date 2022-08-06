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

  Future<bool> signOut(
    String mobileNumber,
    bool Function(String) onErrorCallback,
  );
}
