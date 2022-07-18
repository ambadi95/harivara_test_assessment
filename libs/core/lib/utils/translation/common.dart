import 'package:get/get.dart';

bool get checkIsEnglish => Get.locale != null
    ? (Get.locale!.languageCode.contains('en') ? true : false)
    : true;

bool get checkIsArabic => Get.locale != null
    ? (Get.locale!.languageCode.contains('ar') ? true : false)
    : true;
