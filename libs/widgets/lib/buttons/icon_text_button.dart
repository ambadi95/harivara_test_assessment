import 'package:core/analytics/tracker.dart';
import 'package:core/view/trackable_widget.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:widget_library/colors/crayon_payment_colors.dart';
import 'package:widget_library/dimensions/crayon_payment_text_size.dart';

class CrayonPaymentIconTextButton extends TrackableWidget {
  static const String _identifier = 'CrayonPaymentIconTextButton';
  final Either<IconData, String> customIcon;
  final String text;
  final double? textSize;
  final Color? textColor;
  final double? iconSize;
  final Color? iconColor;
  final Function()? callback;

  const CrayonPaymentIconTextButton({
    Key? key,
    required this.customIcon,
    required this.text,
    this.textSize,
    this.textColor,
    this.iconSize,
    this.iconColor,
    this.callback,
    Tracker? tracker,
    String? actionName,
    Map<String, dynamic>? trackParams,
  }) : super(
          key: key,
          tracker: tracker,
          actionName: actionName,
          params: trackParams,
        );

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      key: Key('$_identifier'),
      onTap: () {
        track();
        if (callback != null) {
          callback!();
        }
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            key: Key('${_identifier}_Icon'),
            width: iconSize,
            height: iconSize,
            child: customIcon.fold(
              (icon) => Icon(
                icon,
                color: iconColor ?? CrayonPaymentColors.crayonPaymentGold,
              ),
              (iconPath) => SvgPicture.asset(iconPath),
            ),
          ),
          SizedBox(
            width: 12,
          ),
          Text(
            text,
            key: Key('${_identifier}_Text'),
            style: Theme.of(context).textTheme.headline4!.copyWith(
                  color: textColor ?? CrayonPaymentColors.crayonPaymentGold,
                  fontSize: textSize ?? CrayonPaymentTextSize.defaultSize,
                ),
          ),
        ],
      ),
    );
  }
}
