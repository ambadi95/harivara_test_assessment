abstract class IPostLoginNavigationFlow<TokenModel> {
  void afterSuccessfulLogin(TokenModel result, String email);
}
