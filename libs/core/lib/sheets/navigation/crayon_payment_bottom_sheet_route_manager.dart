import 'package:core/navigation/i_route_manager.dart';
import 'package:core/sheets/view/crayon_payment_bottom_sheet.dart';
import 'package:flutter/material.dart';

import '../state/crayon_payment_bottom_sheet_state.dart';

class CrayonPaymentBottomSheetRouteManager extends IRouteManager {
  static const moduleIdentifier = 'bottomSheet';

  @override
  Widget getBottomSheet(String bottomSheetName, arguments) {
    switch (bottomSheetName) {
      case CrayonPaymentBottomSheet.viewPath:
        return CrayonPaymentBottomSheet(arguments as CrayonPaymentBottomSheetState);
      default:
        throw Exception('Not implemented');
    }
  }

  @override
  Widget getView(RouteSettings settings) {
    throw UnimplementedError();
  }
}
