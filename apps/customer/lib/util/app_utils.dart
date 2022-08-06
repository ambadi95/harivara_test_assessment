import 'dart:io';


import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';


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






}
