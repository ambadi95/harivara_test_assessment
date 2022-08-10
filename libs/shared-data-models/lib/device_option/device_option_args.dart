import 'package:config/Config.dart';

class DeviceOptionArgs {
  final bool isMember;
  final String destinationPath;
  final UserType userType;

  DeviceOptionArgs(
    this.isMember,
    this.destinationPath,
      this.userType
  );
}
