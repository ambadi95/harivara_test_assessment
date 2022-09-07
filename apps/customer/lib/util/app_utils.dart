import 'dart:io';


import 'package:flutter/foundation.dart';
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

  Future<bool> checkInternet() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        if (kDebugMode) {
          print('connected');
        }
        return true;
      } else {
        return false;
      }
    } on SocketException catch (_) {
      if (kDebugMode) {
        print('not connected');
      }
      //Here you can setState a bool like internetAvailable = false;
      //or use call this before uploading data to firestore/storage depending upon the result, you can move on further.
      return false;
    }
  }







}
