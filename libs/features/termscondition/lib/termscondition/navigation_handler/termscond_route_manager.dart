import 'package:core/navigation/i_route_manager.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/navigator.dart';

import '../view/terms_condition_view.dart';

class TermsConditionRouteManager extends IRouteManager {
  @override
  Widget getView(RouteSettings settings) {
    switch (settings.name) {
      case CrayonTermsCondition.viewPath:
        return const CrayonTermsCondition();
    }
    throw UnimplementedError();
  }
}
