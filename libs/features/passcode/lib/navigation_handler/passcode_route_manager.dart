import 'package:core/navigation/i_route_manager.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/navigator.dart';
import 'package:shared_data_models/passcode/passcode_screen_args.dart';
import '../sub_features/passcode/view/passcode.dart';

class PasscodeRouteManager extends IRouteManager {
  @override
  Widget getView(RouteSettings settings) {
    switch (settings.name) {
      case CrayonPasscodeScreen.viewPath:
        var arguments = settings.arguments as PasscodeScreenArgs;

        return CrayonPasscodeScreen(
          passcodeScreenArgs: arguments,
        );
      default:
        // TODO: implement getView
        throw UnimplementedError();
    }
  }
}
