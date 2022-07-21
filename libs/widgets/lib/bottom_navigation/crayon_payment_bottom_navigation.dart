// ignore: todo
// TODO: This nav bar is designed for demo purposes.
// The navigation bar should be part of the home screen.
// We already have a CrayonPaymentBottomNavigationTabWidget that should be used when
// the HomeScreen is ready.
// AddCardScreen will come from behind the scene.
import 'package:flutter/material.dart';
import 'package:widget_library/bottom_navigation/bottom_navigation_items.dart';

Widget get buildBottomNavigationBar {
  return BottomNavigationBar(
    showSelectedLabels: false,
    showUnselectedLabels: false,

    backgroundColor: const Color(0xFFFFFFFF),

    items: buildBottomNavigationItems(),
  );
}
