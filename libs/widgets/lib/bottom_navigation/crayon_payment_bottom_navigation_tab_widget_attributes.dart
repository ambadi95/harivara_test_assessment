import 'package:flutter/material.dart';

class CrayonPaymentBottomNavigationAttributes {
  final int tabIndex;
  final List<Widget> tabScreens;
  final Color? tabBackgroundColor;
  final Color? selectedItemColor;
  final Color? unselectedItemColor;
  final List<BottomNavigationBarItem> bottomNavigation;
  final Function(int) onTap;
  final Function? goBack;
  final String themeName;

  CrayonPaymentBottomNavigationAttributes({
    required this.themeName,
    required this.tabIndex,
    required this.tabScreens,
    required this.bottomNavigation,
    required this.onTap,
    this.selectedItemColor,
    this.unselectedItemColor,
    this.tabBackgroundColor,
    this.goBack,
  });
}
