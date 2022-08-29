import 'dart:io';


import 'package:config/Config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:widget_library/bottom_sheet/alert_bottom_sheet.dart';


class AppUtils {
  static final AppUtils _appUtils = AppUtils();

  static AppUtils get appUtilsInstance => _appUtils;



  // hide keyboard
  hideKeyboard() {
    SystemChannels.textInput.invokeMethod('TextInput.hide');
  }

  // get percentage size
  double getPercentageSize({double? percentage = 0, bool ofWidth = true}) {
    if (ofWidth) {

      return (Get.width * percentage!) / 100;
    } else {
      return (Get.height * percentage!) / 100;
    }
  }

  //common padding
  EdgeInsetsGeometry commonPadding() {
    return EdgeInsets.all(
      AppUtils.appUtilsInstance
          .getPercentageSize(percentage: 2, ofWidth: false),
    );
  }


  Future showErrorBottomSheet({required String title,required Function onClose}){
   return  Get.bottomSheet(
     Wrap(
      children: [
        Container(
          width: double.infinity,
          padding:
          const EdgeInsets.only(left: 30, right: 30, top: 47, bottom: 33),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20)),
          ),
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const  SizedBox(
                    height: 10,
                  ),

                    Image.asset(
                      AN_Kyc_Credit_ERROR,
                      height: 60,width: 60,
                    ),
                  const  SizedBox(
                    height: 36,
                  ),
                 const Text(
                    "Error",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20.0,
                      height: 1.15,
                      letterSpacing: 0.15,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                  const  SizedBox(
                    height: 25,
                  ),
                  Text(
                    title.tr,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14.0,
                      height: 1.15,
                      letterSpacing: 0.15,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff676767),
                    ),
                  ),

                  const   SizedBox(
                      height: 32,
                    ),

                ],
              ),

                Align(
                  // ignore: sort_child_properties_last
                  child: GestureDetector(
                    onTap: () => onClose(),
                    child: Icon(Icons.close),
                  ),
                  alignment: Alignment.topRight,
                )
            ],
          ),
        ),
      ],
    ), isScrollControlled: false,
     isDismissible: true,);

  }








}
