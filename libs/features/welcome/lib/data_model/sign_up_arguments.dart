import 'package:shared_data_models/signup/sign_up_type.dart';
import 'package:config/Config.dart';

class SignUpArguments {
  final String title;
  final String subTitle;
  final UserType userType;
  final SignupType signupType;
  final bool isProgressBarVisible;

  SignUpArguments(this.title, this.subTitle, this.userType, this.signupType,
      this.isProgressBarVisible);
}
