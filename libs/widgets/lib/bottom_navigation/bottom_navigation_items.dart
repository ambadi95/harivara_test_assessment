import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:widget_library/icons/crayon_payment_icon_paths.dart';

List<BottomNavigationBarItem> buildBottomNavigationItems() {
  return [
    BottomNavigationBarItem(
      icon: SvgPicture.asset(
        CrayonPaymentIconPath.iconHomePath,
      ),
      label: '',
    ),
    BottomNavigationBarItem(
      icon: SvgPicture.asset(
        CrayonPaymentIconPath.iconQrScanPath,
      ),
      label: '',
    ),
    BottomNavigationBarItem(
      icon: SvgPicture.asset(
        CrayonPaymentIconPath.iconPayPath,
      ),
      label: '',
    ),
  ];
}
