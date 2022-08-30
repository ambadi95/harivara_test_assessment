import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:widget_library/page_header/text_ui_data_model.dart';

/// The possible button themes
enum CrayonPaymentTextStyleVariant {
  normal, // primary text - bodyText1
  headline1,
  headline2,
  headline3,
  headline4,
  headline5,
  headline6,
  subtitle1,
  subtitle2,
  bodyText1,
  bodyText2,
  headline18,
  hints,
  amount,
  otp,
  description,
  wallet,
  headlineThirtyTwo,
  bottomSheetHeader,
  hyperLinkText,
  overline1
}

enum CrayonPaymentTextVerticalSpacing {
  medium,
  normal,
  narrow,
}

double _lineHeight(CrayonPaymentTextVerticalSpacing? verticalSpacing) {
  switch (verticalSpacing) {
    case CrayonPaymentTextVerticalSpacing.narrow:
      return 1.0;
    case CrayonPaymentTextVerticalSpacing.normal:
      return 1.2;
    case CrayonPaymentTextVerticalSpacing.medium:
      return 1.5;
    default:
      return 1.2;
  }
}

TextStyle buildTextStyle({
  required BuildContext context,
  required CrayonPaymentTextStyleVariant variant,
  CrayonPaymentTextVerticalSpacing? verticalSpacing,
}) {
  final lineHeight = _lineHeight(verticalSpacing);

  final bool _isArabic = (Get.locale == const Locale('ar')) ? true : false;

  String _fontFamily() {
    return _isArabic ? 'Zarid-Medium' : 'Montserrat';
  }

  switch (variant) {
    case CrayonPaymentTextStyleVariant.headline1:
      return Theme.of(context)
          .textTheme
          .headline1!
          .copyWith(height: lineHeight, fontFamily: _fontFamily());

    case CrayonPaymentTextStyleVariant.headline2:
      return Theme.of(context)
          .textTheme
          .headline2!
          .copyWith(height: lineHeight, fontFamily: _fontFamily());

    case CrayonPaymentTextStyleVariant.headline3:
      return Theme.of(context).textTheme.headline3!.copyWith(
            height: lineHeight,
            fontFamily: _fontFamily(),
            fontSize: _isArabic ? 26 : 24,
          );

    case CrayonPaymentTextStyleVariant.headline4:
      return Theme.of(context).textTheme.headline4!.copyWith(
            height: lineHeight,
            fontFamily: _fontFamily(),
            fontSize: _isArabic ? 18 : 16,
          );
    case CrayonPaymentTextStyleVariant.headline18:
      return Theme.of(context).textTheme.headline4!.copyWith(
            height: lineHeight,
            fontFamily: _fontFamily(),
            fontSize: _isArabic ? 18 : 18,
          );

    case CrayonPaymentTextStyleVariant.headline5:
      return Theme.of(context).textTheme.headline5!.copyWith(
            height: lineHeight,
            fontFamily: _fontFamily(),
            fontSize: _isArabic ? 16 : 14,
          );

    case CrayonPaymentTextStyleVariant.headline6:
      return Theme.of(context).textTheme.headline6!.copyWith(
            height: lineHeight,
            fontFamily: _fontFamily(),
            fontSize: _isArabic ? 22 : 20,
          );

    case CrayonPaymentTextStyleVariant.overline1:
      return Theme.of(context).textTheme.headline6!.copyWith(
            height: lineHeight,
            fontFamily: _fontFamily(),
            fontSize: _isArabic ? 12 : 12,
          );

    case CrayonPaymentTextStyleVariant.hints:
      return Theme.of(context)
          .inputDecorationTheme
          .hintStyle!
          .copyWith(height: lineHeight);

    case CrayonPaymentTextStyleVariant.subtitle1:
      return Theme.of(context)
          .textTheme
          .subtitle1!
          .copyWith(height: lineHeight);

    case CrayonPaymentTextStyleVariant.subtitle2:
      return Theme.of(context)
          .textTheme
          .subtitle2!
          .copyWith(height: lineHeight);

    case CrayonPaymentTextStyleVariant.bodyText1:
      return Theme.of(context).textTheme.bodyText1!.copyWith(
            height: lineHeight,
            fontFamily: _fontFamily(),
            fontSize: _isArabic ? 22 : 20,
          );

    case CrayonPaymentTextStyleVariant.bodyText2:
      return Theme.of(context).textTheme.bodyText2!.copyWith(
            height: lineHeight,
            fontFamily: _fontFamily(),
            fontSize: _isArabic ? 16 : 16,
          );

    case CrayonPaymentTextStyleVariant.amount:
      return Theme.of(context)
          .textTheme
          .bodyText2!
          .copyWith(height: lineHeight);

    case CrayonPaymentTextStyleVariant.otp:
      return Theme.of(context)
          .textTheme
          .headline3!
          .copyWith(height: lineHeight);

    case CrayonPaymentTextStyleVariant.description:
      return Theme.of(context).textTheme.headline5!.copyWith(
            height: lineHeight,
            fontFamily: _fontFamily(),
            fontSize: _isArabic ? 15 : 13,
          );

    case CrayonPaymentTextStyleVariant.wallet:
      return Theme.of(context).textTheme.headline3!.copyWith(
            height: lineHeight,
            fontFamily: _fontFamily(),
            fontSize: _isArabic ? 48 : 46,
          );

    case CrayonPaymentTextStyleVariant.headlineThirtyTwo:
      return Theme.of(context).textTheme.headline3!.copyWith(
            height: lineHeight,
            fontFamily: _fontFamily(),
            fontSize: _isArabic ? 34 : 32,
          );
    case CrayonPaymentTextStyleVariant.bottomSheetHeader:
      return Theme.of(context).textTheme.headline3!.copyWith(
            height: lineHeight,
            fontFamily: _fontFamily(),
            fontSize: _isArabic ? 34 : 32,
          );
    case CrayonPaymentTextStyleVariant.hyperLinkText:
      return Theme.of(context).textTheme.headline4!.copyWith(
            height: lineHeight,
            decorationStyle: TextDecorationStyle.solid,
            decoration: TextDecoration.underline,
            fontFamily: _fontFamily(),
            fontSize: _isArabic ? 18 : 16,
          );
    default:
      return Theme.of(context)
          .textTheme
          .bodyText1!
          .copyWith(height: lineHeight);
  }
}

///
/// A variant of the [CrayonPaymentDockedButton] that wraps the [ElevatedButton] and
/// restyles it rather then extending the [ButtonStyleButton]
///
class CrayonPaymentText extends StatelessWidget {
  final TextUIDataModel text;

  final EdgeInsets? edgeInsets;

  /// The variant controls the button colours and can be `primary`, the default,
  /// `secondary` and `tertiary`
  final CrayonPaymentTextVerticalSpacing? lineVerticalSpacing;

  CrayonPaymentText({
    Key? key,
    required this.text,
    this.edgeInsets,
    this.lineVerticalSpacing,
    colorVariant,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textStyle = buildTextStyle(
      context: context,
      variant: text.styleVariant ?? CrayonPaymentTextStyleVariant.normal,
      verticalSpacing: lineVerticalSpacing,
    ).copyWith(color: text.color, fontWeight: text.fontWeight);

    return edgeInsets == null
        ? _buildText(textStyle)
        : Padding(padding: edgeInsets!, child: _buildText(textStyle));
  }

  Text _buildText(TextStyle textStyle) {
    return Text(
      text.text.tr,
      key: Key('Text'),
      style: textStyle,
      overflow: text.overflow,
      textAlign: text.textAlign,
      maxLines: text.maxLines,
    );
  }
}

class CrayonPaymentTextSpan extends TextSpan {
  CrayonPaymentTextSpan({
    required BuildContext context,
    required TextUIDataModel text,
  }) : super(
          text: text.text.tr,
          style: buildTextStyle(
            context: context,
            variant: text.styleVariant ?? CrayonPaymentTextStyleVariant.normal,
          ),
        );
}
