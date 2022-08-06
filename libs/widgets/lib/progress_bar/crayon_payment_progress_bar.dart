import 'package:flutter/material.dart';
import 'package:widget_library/theme/crayon_payment_theme.dart';
import 'package:core/utils/extensions/string_extensions.dart';

class CrayonPaymentProgressBar extends StatelessWidget {
  final double? value;
  final double? height;

  final Color? valueColor;
  final Color? backgroundColor;

  const CrayonPaymentProgressBar({
    Key? key,
    this.value,
    this.height,
    this.valueColor,
    this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      key: Key('CrayonPaymentProgressBar_SizedBox'),
      height: height ?? 3,
      child: LinearProgressIndicator(
        key: Key('CrayonPaymentProgressBar_LinearProgressIndicator'),
        value: value,
        valueColor: AlwaysStoppedAnimation<Color?>(
          valueColor ??
              (CrayonPaymentTheme()
                      .defaultThemeData
                      .highlightTextColor
                      .isNullOrEmpty()
                  ? Theme.of(context).primaryColor
                  : CrayonPaymentTheme()
                      .defaultThemeData
                      .highlightTextColor
                      .toColor()),
        ),
        backgroundColor: backgroundColor ?? Theme.of(context).backgroundColor,
      ),
    );
  }
}
