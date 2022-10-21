import 'package:config/Colors.dart';
import 'package:core/navigation/modal_bottom_sheet.dart';
import 'package:core/navigation/navigation_manager.dart';
import 'package:core/navigation/navigation_type.dart';
import 'package:core/sheets/data_model/button_options.dart';
import 'package:core/sheets/state/crayon_payment_bottom_sheet_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:widget_library/helpers/error/helper/error_helper.dart';
import 'package:widget_library/icons/crayon_payment_bottom_sheet_icon.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import '../view/widgets/apply_filter.dart';

class ReferralProgramNavigationHandler with ErrorHandler {
  final NavigationManager _navigationManager;

  ReferralProgramNavigationHandler(this._navigationManager);

  Future<void> goBack() async {
    _navigationManager.goBack();
  }

  Future<void> navigateToSuccessReferralBottomSheet(String message) async {
    final CrayonPaymentBottomSheetIcon icon =
    CrayonPaymentBottomSheetSuccessIcon();
    final CrayonPaymentBottomSheetState infoState =
    CrayonPaymentBottomSheetState.infoState(
      buttonOptions: [
        ButtonOptions(Black, "SU_button_text".tr, () => goBack(), false)
      ],
      title:'PRI_success_message'.tr + message +'!',
      disableCloseButton: true,
      bottomSheetIcon: icon,
      //subtitle: 'Invite has been successfully sent to ${message}!',
    );

    _navigationManager.navigateTo(
      'bottomSheet/crayonPaymentBottomSheet',
      const NavigationType.bottomSheet(),
      arguments: infoState,
    );
  }


  Future<void> navigateToFilterBottomSheet(BuildContext context) async {
    final CrayonPaymentBottomSheetIcon icon =
    CrayonPaymentBottomSheetAppLanguageIconIcon();
    final CrayonPaymentBottomSheetState infoState =
    CrayonPaymentBottomSheetState.referralApplyFiler(
      widgetOptions: [
        ApplyFilter(),
      ],
      buttonOptions: [
        ButtonOptions(Black, 'PRS_apply', () => {Navigator.pop(context)}, false),
      ],
      disableCloseButton: true,
      bottomSheetIcon: icon,
      title: 'PRS_filter_by',
    );

    _navigationManager.navigateTo(
      'bottomSheet/crayonPaymentBottomSheet',
      const NavigationType.bottomSheet(),
      modalBottomSheet: ModalBottomSheet(
        context: context,
        height: MediaQuery.of(context).size.height * 0.60,
      ),
      arguments: infoState,
    );
  }

}
