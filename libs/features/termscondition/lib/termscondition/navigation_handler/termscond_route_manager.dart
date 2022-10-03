import 'package:config/Config.dart';
import 'package:core/navigation/i_route_manager.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/navigator.dart';
import 'package:shared_data_models/termscondition_faq_screen_args/termscondition_faq_screen_args.dart';
import 'package:termscondition/termscondition/view/terms_condition_screen.dart';
import 'package:shared_data_models/termscondition_faq_screen_args/termscondition_screen_args.dart';
import '../view/terms_condition_view.dart';

class TermsConditionRouteManager extends IRouteManager {
  @override
  Widget getView(RouteSettings settings) {
    switch (settings.name) {
      case CrayonTermsCondition.viewPath:
        var arguments = settings.arguments as TermsConditionAndFaqScreenArgs;
        return CrayonTermsCondition(
          termsConditionAndFaqScreenArgs: arguments,
        );
      case CrayonTermsConditionScreen.viewPath:
        var arguments = settings.arguments as TermsConditionScreenArgs;
        return CrayonTermsConditionScreen(
          termsConditionScreenArgs: arguments,
        );
    }
    throw UnimplementedError();
  }
}
