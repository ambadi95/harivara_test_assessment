import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:widget_library/page_header/text_ui_data_model.dart';
import 'package:widget_library/static_text/crayon_payment_text.dart';

class ReusableInfoRow extends StatelessWidget {
  static const String _identifier = 'ReusableInfoRow';
  static const double _iconSize = 60.0;
  static const Color _titleColor = Color(0xFF565451);
  static const Color _subtitleColor = Color(0xFF565451);

  /// [icon] can be either an IconData (left) that is already available or an
  /// image from path (right).
  final Either<IconData, String> icon;
  final double iconSize;
  final String? title;
  final String? subtitle;
  final Color? titleColor;
  final Color? subtitleColor;
  final Color? iconBackgroundColor;

  const ReusableInfoRow({
    Key? key,
    required this.icon,
    this.iconSize = _iconSize,
    this.title,
    this.subtitle,
    Color? titleColor,
    Color? subtitleColor,
    Color? iconBackgroundColor,
  })  : titleColor = titleColor ?? _titleColor,
        subtitleColor = subtitleColor ?? _subtitleColor,
        iconBackgroundColor = iconBackgroundColor,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      key: Key('${_identifier}_Widget'),
      builder: (BuildContext context, BoxConstraints constraints) {
        return Row(
          key: Key('${_identifier}_Row'),
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              key: Key('${_identifier}_Icon'),
              width: iconSize,
              height: iconSize,
              decoration: icon.fold(
                (icon) => BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: iconBackgroundColor,
                ),
                (iconPath) => null,
              ),
              child: icon.fold(
                (icon) => Icon(icon),
                (iconPath) => SvgPicture.asset(iconPath),
              ),
            ),
            if ((title != null) || (subtitle != null)) ...[
              const SizedBox(
                width: 21,
              ),
            ],
            Column(
              key: Key('${_identifier}_Column'),
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (title != null) ...[
                  CrayonPaymentText(
                    key: Key('${_identifier}_Title'),
                    text: TextUIDataModel(
                      title!,
                      styleVariant: CrayonPaymentTextStyleVariant.headline5,
                      color: titleColor,
                    ),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                ],
                if (subtitle != null) ...[
                  SizedBox(
                    key: Key('${_identifier}_Subtitle'),
                    width: 0.7 * constraints.maxWidth,
                    child: CrayonPaymentText(
                      text: TextUIDataModel(
                        subtitle!,
                        styleVariant: CrayonPaymentTextStyleVariant.headline5,
                        textAlign: TextAlign.start,
                        color: subtitleColor,
                      ),
                      lineVerticalSpacing: CrayonPaymentTextVerticalSpacing.medium,
                    ),
                  ),
                ],
              ],
            ),
          ],
        );
      },
    );
  }
}
