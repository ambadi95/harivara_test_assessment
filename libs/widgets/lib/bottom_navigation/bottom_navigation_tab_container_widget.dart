import 'package:flutter/material.dart';
import 'package:widget_library/bottom_navigation/crayon_payment_bottom_navigation_tab_widget_attributes.dart';

class _Constants {
  static const borderRadius = 32.0;
  static const shadowRadius = 20.0;
  static const bottomTabHeight = 92.0;
}

class CrayonPaymentBottomNavigationBarContanerWidget extends StatefulWidget {
  final CrayonPaymentBottomNavigationAttributes attributes;
  final Function(int) onTap;
  final int selectedTabIndex;

  CrayonPaymentBottomNavigationBarContanerWidget({
    Key? key,
    required this.attributes,
    required this.onTap,
    this.selectedTabIndex = 0,
  }) : super(key: key);

  @override
  _CrayonPaymentBottomNavigationBarContanerWidgetState createState() =>
      _CrayonPaymentBottomNavigationBarContanerWidgetState();
}

class _CrayonPaymentBottomNavigationBarContanerWidgetState
    extends State<CrayonPaymentBottomNavigationBarContanerWidget> {
  late int _selectedTabIndex;

  @override
  void initState() {
    super.initState();
    _selectedTabIndex = widget.selectedTabIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      key: Key('CrayonPaymentBottomNavigationBarContanerWidget_Container'),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(
            _Constants.borderRadius,
          ),
          topLeft: Radius.circular(
            _Constants.borderRadius,
          ),
        ),
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(244, 244, 240, 0.5),
            spreadRadius: 0,
            blurRadius: _Constants.shadowRadius,
          ),
        ],
      ),
      child: ClipRRect(
        key: Key('CrayonPaymentBottomNavigationBarContanerWidget_ClipRect'),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(_Constants.borderRadius),
          topRight: Radius.circular(_Constants.borderRadius),
        ),
        child: SizedBox(
          key: Key('CrayonPaymentBottomNavigationBarContanerWidget_SizedBox'),
          height: _Constants.bottomTabHeight,
          child: BottomNavigationBar(
            key: Key(
                'CrayonPaymentBottomNavigationBarContanerWidget_BottomNavigationBar'),
            showSelectedLabels: false,
            showUnselectedLabels: false,
            backgroundColor: widget.attributes.tabBackgroundColor,
            // selectedItemColor: (src.attributes.selectedItemColor != null)
            //     ? src.attributes.selectedItemColor
            //     : CrayonPaymentTheme.of(context).theme.colorStyles.buttonColors.primary.normal.color,
            // unselectedItemColor: (src.attributes.unselectedItemColor != null)
            //     ? src.attributes.unselectedItemColor
            //     : CrayonPaymentTheme.of(context).theme.colorStyles.buttonColors.primary.disabled.color,
            type: BottomNavigationBarType.fixed,
            currentIndex: _selectedTabIndex,
            onTap: (index) {
              setState(() {
                _selectedTabIndex = index;
              });
              widget.onTap(index);
            },
            items: widget.attributes.bottomNavigation,
          ),
        ),
      ),
    );
  }
}
