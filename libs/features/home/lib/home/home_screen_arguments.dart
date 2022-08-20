import 'package:config/Config.dart';
import 'package:shared_data_models/passcode/passcode_verification_type.dart';

class HomeScreenArgs {
  final bool isAgent;
  final UserType userType;

  HomeScreenArgs({
    required this.isAgent,
      required this.userType}
  );
}

