import 'package:config/Config.dart';
import 'package:core/logging/logger.dart';
import 'package:core/navigation/i_route_manager.dart';
import 'package:flutter/material.dart';
import 'package:welcome/data_model/agent_detail_arguments.dart';
import 'package:welcome/data_model/sign_up_arguments.dart';
import 'package:welcome/sub_features/details/view/details.dart';
import 'package:welcome/sub_features/enrollment_success/view/enrollment_success_screen.dart';
import 'package:welcome/sub_features/signup/sub_features/customer_onboarding_approval/view/customer_onboarding_approval.dart';
import 'package:welcome/sub_features/signup/view/signup.dart';

import 'package:welcome/sub_features/welcome/view/welcome_screen.dart';
import 'package:welcome/sub_features/welcome_back/view/welcome_back.dart';

import '../sub_features/agent_details/view/agent_details.dart';
import '../sub_features/signup/sub_features/customer_registration_options/view/registration_approval.dart';
import '../sub_features/welcome/data_model/welcome_model.dart';

class WelcomeRouteManager extends IRouteManager {
  @override
  Widget getView(RouteSettings settings) {
    switch (settings.name) {
      case CrayonWelcomScreen.viewPath:
        var arguments = settings.arguments as WelcomeScreenArgs;
        return CrayonWelcomScreen(
          welcomeScreenArgs: arguments,
        );
      case SignUp.viewPath:
        var arguments = settings.arguments as SignUpArguments;
        return SignUp(
          signUpArguments: arguments,
        );
      case DetailsScreen.viewPath:
        var arguments = settings.arguments as UserType;
        UserType type = UserType.Customer;
        return DetailsScreen(
          userType: type,
        );
      case EnrollmentSuccessScreen.viewPath:
        var argument = settings.arguments as UserType;
        return EnrollmentSuccessScreen(
          userType: argument,
        );
      case CrayonWelcomBackScreen.viewPath:
        var arguments = settings.arguments as UserType;
        return CrayonWelcomBackScreen(
          userType: arguments ,
        );
      case AgentDetailsScreen.viewPath:
        var arguments = settings.arguments as AgentDetailScreenArguments;
        return AgentDetailsScreen(
          agentDetailScreenArguments: arguments,
        );
      case RegistrationApproval.viewPath :
        var arguments = settings.arguments as SignUpArguments;
        return RegistrationApproval(
          signUpArguments: arguments,
        );
      case CustomerOnBoardingApproval.viewPath :
        var arguments = settings.arguments as SignUpArguments;
        return CustomerOnBoardingApproval(
          signUpArguments: arguments,
        );
      default:
        throw UnimplementedError();
    }
  }
}
