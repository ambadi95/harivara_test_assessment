import 'package:core/analytics/tracker.dart';
import 'package:core/view/trackable_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:widget_library/colors/crayon_payment_colors.dart';

class CrayonPaymentTextButton extends TrackableWidget {
  final Function()? onPressed;
  final Widget? child;
  final String text;
  final Color? color;
  final TextStyle? textStyle;
  final Alignment? alignment;
  final TextAlign? textAlign;

  const CrayonPaymentTextButton({
    Key? key,
    this.onPressed,
    this.child,
    required this.text,
    this.color,
    this.textStyle,
    this.alignment,
    this.textAlign = TextAlign.start,
    Tracker? tracker,
    String? action,
    Map<String, dynamic>? trackingParams,
  }) : super(
          key: key,
          tracker: tracker,
          actionName: action,
          params: trackingParams,
        );

  @override
  Widget build(BuildContext context) {
    final bool _isArabic = (Get.locale == const Locale('ar')) ? true : false;

    return TextButton(
      key: Key('CrayonPaymentTextButton_TextButton'),
      onPressed: () {
        if (onPressed != null) {
          track();
          onPressed!();
        }
      },
      style: Theme.of(context).textButtonTheme.style,
      child: child ??
          Text(
            _localizedText(context, text),
            textAlign: textAlign,
            key: Key('CrayonPaymentTextButton_Text'),
            style: TextStyle(
              fontFamily: _isArabic ? 'Zarid-Medium' : 'Brown',
              fontSize: _isArabic ? 18 : 16,
              color: color ?? CrayonPaymentColors.crayonPaymentGold,
            ),
          ),
    );
  }

  String _localizedText(
    BuildContext context,
    String text,
  ) {
    if (text.toUpperCase() == text) {
      return (text.tr).toUpperCase();
    } else {
      return (text.tr);
    }
  }
}
