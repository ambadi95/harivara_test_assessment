import 'package:flutter/material.dart';
import 'package:widget_library/bottom_navigation/crayon_payment_bottom_navigation_tab_widget_attributes.dart';
import 'package:widget_library/scaffold/crayon_payment_scaffold.dart';

class _Constants {
  static const borderRadius = 32.0;
  static const shadowRadius = 20.0;
  static const snackBarMessage = 'Press again to exit app';
}

class CrayonPaymentBottomNavigationTabWidget extends StatefulWidget {
  CrayonPaymentBottomNavigationTabWidget({
    Key? key,
    this.attributes,
  }) : super(key: key);

  final CrayonPaymentBottomNavigationAttributes? attributes;

  @override
  _CrayonPaymentBottomNavigationTabWidgetState createState() =>
      _CrayonPaymentBottomNavigationTabWidgetState();
}

class _CrayonPaymentBottomNavigationTabWidgetState
    extends State<CrayonPaymentBottomNavigationTabWidget> {
  List<Widget>? listOfScreens;
  final radius = Radius.circular(_Constants.borderRadius);
  DateTime currentBackPressTime = DateTime.now();

  @override
  void initState() {
    super.initState();
    listOfScreens = widget.attributes!.tabScreens;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      key: Key('CrayonPaymentBottomNavigationTabWidget_WillPopScope'),
      onWillPop: () => onWillPop(context),
      child: buildBottomBar(context),
    );
  }

  Future<bool> onWillPop(BuildContext context) {
    if (widget.attributes!.tabIndex == 0) {
      if (DateTime.now().difference(currentBackPressTime).inSeconds > 2) {
        currentBackPressTime = DateTime.now();
        _showSnackBar(context);
        return Future.value(false);
      }
      return Future.value(true);
    } else {
      widget.attributes!.goBack?.call();
      return Future.value(false);
    }
  }

  void _showSnackBar(BuildContext context) {
    final showMessage = ScaffoldMessenger.of(context);
    showMessage.showSnackBar(
      SnackBar(
        key: Key('CrayonPaymentBottomNavigationTabWidget_SnackBar'),
        content: Text(_Constants.snackBarMessage, key: Key('Text')),
        duration: Duration(seconds: 2),
      ),
    );
  }

  Widget buildBottomBar(BuildContext context) {
    return CrayonPaymentScaffold(
      extendedBodyClip: true,
      body: IndexedStack(
        key: Key('CrayonPaymentBottomNavigationTabWidget_BuildBottomBar_IndexedStack'),
        index: widget.attributes!.tabIndex,
        children: listOfScreens!,
      ),
      bottomNavigationBar: bottomNavigationBar,
      themeName: widget.attributes!.themeName,
    );
  }

  Widget get bottomNavigationBar {
    return Container(
      key: Key('CrayonPaymentBottomNavigationTabWidget_bottomNavigationBar_Container'),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(_Constants.borderRadius),
          topLeft: Radius.circular(_Constants.borderRadius),
        ),
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(244, 244, 240, 0.5),
            spreadRadius: 0,
            blurRadius: _Constants.shadowRadius,
          ),
        ],
      ),
      child: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        backgroundColor: widget.attributes!.tabBackgroundColor,
        type: BottomNavigationBarType.fixed,
        currentIndex: widget.attributes!.tabIndex,
        onTap: (int index) {
          widget.attributes!.onTap(index);
        },
        items: widget.attributes!.bottomNavigation,
      ),
    );
  }
}
