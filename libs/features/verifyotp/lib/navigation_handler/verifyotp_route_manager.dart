import 'package:core/navigation/i_route_manager.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/navigator.dart';
import 'package:shared_data_models/otp/otp_screen_args.dart';
import 'package:verifyotp/verifyotp/view/verifyotp.dart';

class VerifyOtpRouteManager extends IRouteManager {
  @override
  Widget getView(RouteSettings settings) {
    switch (settings.name) {
      case CrayonVerifyOtpScreen.viewPath:
        var arguments = settings.arguments as OtpScreenArgs;

        return CrayonVerifyOtpScreen(
          otpScreenArgs: arguments,
        );
      default:
        // TODO: implement getView
        throw UnimplementedError();
    }
  }
}
