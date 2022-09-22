

import 'dart:ui';
import 'package:config/Colors.dart';
import 'package:config/Styles.dart';
import 'package:crayon_payment_customer/util/app_utils.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:config/Config.dart';
import 'package:configuremdm/configuremdm_argument.dart';
import 'package:configuremdm/view/configuremdm_screen.dart';
import 'package:core/navigation/navigation_manager.dart';
import 'package:core/navigation/navigation_type.dart';
import 'package:crayon_payment_customer/home/view/home_screen.dart';
import 'package:scanqrcode/view/successful_screen.dart';
import 'package:widget_library/helpers/error/helper/error_helper.dart';
import 'package:home/home/view/home_screen.dart';
import 'package:home/home/home_screen_arguments.dart';
import 'package:widget_library/page_header/text_ui_data_model.dart';
import 'package:widget_library/static_text/crayon_payment_text.dart';

class ScanQRCodeNavigationHandler with ErrorHandler {
  final NavigationManager _navigationManager;
  final String _identifier = 'scancode-screen';

  ScanQRCodeNavigationHandler(this._navigationManager);

  Future<void> navigateToWelcomeBack() async {
    await _navigationManager.navigateTo(
      CrayonCustomerHomeScreen.viewPath,
      const NavigationType.replace(),
    );
  }


  Future<void> navigateToAgentHome() async {
    var argument = HomeScreenArgs(isAgent: true, userType: UserType.Agent);
    await _navigationManager.navigateTo(
        CrayonHomeScreen.viewPath, const NavigationType.replace(),
        arguments: argument);
  }

  Future<void> goBack() async {
    _navigationManager.goBack();
  }


  Future<void> navigateToSuccessScreen() async {
   var argument = "Bharti";
    await _navigationManager.navigateTo(
      SuccessScreen.viewPath,
      const NavigationType.push(),
      arguments: argument
    );
  }

  Future<void> navigateToConfigureMdmScreen(String imei1, String imei2) async {
    var argument = ConfigureMdmArgs(imei1 : imei1, imei2 : imei2);
    await _navigationManager.navigateTo(
        ConfigureMdmScreen.viewPath,
        const NavigationType.push(),
        arguments: argument
    );
  }

  Future<void> showSuccessBottomSheet(
      String imei1, String imei2, String modelName,  BuildContext context) async {
    showModalBottomSheet(
        barrierColor: const Color(0xFF9B9B9B).withOpacity(0.3),
        backgroundColor: Colors.transparent,
        isDismissible: false,
        isScrollControlled: true,
        enableDrag: false,
        context: context,
        elevation: 15,
        builder: (BuildContext bc) {
          return BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
            child: Container(
              height: MediaQuery.of(context).size.height * .45,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24),
                  ),
                  color: Colors.white),
              padding: const EdgeInsets.only(top: 20.0),
              child: SizedBox(height: Get.height * 0.45, child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ListView(
                  children: [
                    const Image(
                      image: AssetImage(ES_succes_icon),
                      width: 78,
                      height: 78,
                    ),
                    SizedBox(
                      height: AppUtils.appUtilsInstance.getPercentageSize(
                        percentage: 8,
                      ),
                    ),
                    // CrayonPaymentText(
                    //   key: Key('${_identifier}_scan_success_msg'),
                    //   text: TextUIDataModel(
                    //       'scan_success_msg'.tr.replaceAll('_name_', modelName),
                    //       textAlign: TextAlign.center,
                    //       styleVariant: CrayonPaymentTextStyleVariant.subtitle1,
                    //       color: AN_SubTitleColor,
                    //       fontWeight: FontWeight.w600),
                    // ),
                    Padding(
                      padding: const EdgeInsets.only(left:10, right: 10),
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          text: 'scan_success_msg_1'.tr,

                          style: const TextStyle(
                              fontFamily: 'Montserrat',

                              fontSize: 20, color: Colors.black, fontWeight: FontWeight.w500
                          ),
                          children:  <TextSpan>[
                            TextSpan(
                                text: modelName,
                                style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 20, color : Colors.black)),
                            TextSpan(
                                text: "scan_success_msg_2".tr,
                                style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 20, color : Colors.black)),

                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: AppUtils.appUtilsInstance.getPercentageSize(
                        percentage: 8,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
                      child: GestureDetector(
                        onTap: () async {
                          navigateToConfigureMdmScreen(imei1, imei2);
                        },
                        child: Container(
                          width: double.infinity,
                          height: 50,
                          decoration: BoxDecoration(
                              color: SU_button_color, borderRadius: BorderRadius.circular(2.0)),
                          child: Center(
                            child: Text(
                              'configure_mdm_btn'.tr,
                              style: SU_button_text_style,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )),
            ),
          );
        });
  }


}
