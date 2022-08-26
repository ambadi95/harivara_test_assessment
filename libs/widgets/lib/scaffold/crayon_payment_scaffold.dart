import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:widget_library/app_bars/crayon_payment_app_bar_attributes.dart';
import 'package:widget_library/app_bars/crayon_payment_app_bar.dart';
import 'package:widget_library/dimensions/crayon_payment_dimensions.dart';
import 'package:widget_library/theme/crayon_payment_theme.dart';

class CrayonPaymentScaffold extends StatelessWidget {
  @override
  final Key? key;
  final String? themeName;
  final CrayonPaymentAppBarAttributes? appBarAttributes;
  final bool resizeToAvoidBottomInset;
  final Widget body;
  final Widget? bottomNavigationBar;
  final bool extendedBodyClip;
  final CrayonPaymentBrightness themeBrightness;
  final EdgeInsets screenPadding;
  final EdgeInsets appBarPadding;
  final Color ?scaffoldBackgroundColor ;

  static final EdgeInsets _screenPadding = EdgeInsets.symmetric(
    horizontal: CrayonPaymentDimensions.defaultMargin,
  );
  static final EdgeInsets _appBarPadding = EdgeInsets.symmetric(
    horizontal: CrayonPaymentDimensions.defaultMargin,
  );

  CrayonPaymentScaffold({
    this.key,
    this.themeName,
    this.appBarAttributes,
    this.resizeToAvoidBottomInset = true,
    this.extendedBodyClip = false,
    required this.body,
    this.bottomNavigationBar,
    this.scaffoldBackgroundColor =Colors.white,
    this.themeBrightness = CrayonPaymentBrightness.light,
    EdgeInsets? screenPadding,
    EdgeInsets? appBarPadding,
  })  : screenPadding = screenPadding ?? _screenPadding,
        appBarPadding = appBarPadding ?? _appBarPadding;

  @override
  Widget build(BuildContext context) {
    final theme = CrayonPaymentTheme().themeFor(themeName);
    return Theme(
      key: Key('CrayonPaymentScaffold_CrayonPaymentTheme'),
      data: theme,
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle(
          // For Android.
          // Use [light] for white status bar and [dark] for black status bar.
          statusBarIconBrightness:
              themeBrightness == CrayonPaymentBrightness.dark
                  ? Brightness.dark
                  : Brightness.light,
          // For iOS.
          // Use [dark] for white status bar and [light] for black status bar.
          statusBarBrightness: themeBrightness == CrayonPaymentBrightness.dark
              ? Brightness.dark
              : Brightness.light,
        ),
        child: Scaffold(
          backgroundColor: scaffoldBackgroundColor,
          appBar: (appBarAttributes != null)
              ? CrayonPaymentDefaultAppBar(
                  context,
                  appBarAttributes!,
                  theme,
                  appBarPadding,
                )
              : null,
          body: Padding(
            padding: screenPadding,
            child: body,
          ),
          bottomNavigationBar: bottomNavigationBar,
          extendBody: extendedBodyClip,
        ),
      ),
    );
  }
}

enum CrayonPaymentBrightness { dark, light }
