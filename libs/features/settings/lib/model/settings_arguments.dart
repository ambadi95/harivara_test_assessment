import 'package:config/Config.dart';
import 'package:shared_data_models/passcode/passcode_verification_type.dart';

class SettingsScreenArgs {
  final bool isAgent;
  final UserType userType;

  SettingsScreenArgs({required this.isAgent, required this.userType});
}
