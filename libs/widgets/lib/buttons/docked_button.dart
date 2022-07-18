import 'package:core/analytics/tracker.dart';
import 'package:core/view/trackable_widget.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:widget_library/colors/crayon_payment_colors.dart';
import 'package:widget_library/padding.dart';
import 'package:widget_library/page_header/text_ui_data_model.dart';
import 'package:widget_library/spacers/crayon_payment_spacers.dart';
import 'package:widget_library/static_text/crayon_payment_text.dart';

/// A variant of the [CrayonPaymentDockedButton] that wraps the [ElevatedButton] and
/// restyles it rather then extending the [ButtonStyleButton]
class CrayonPaymentDockedButton extends TrackableWidget {
  static final String _identifier = 'CrayonPaymentDockedButton';

  final String title;
  final Color textColor;
  final CrayonPaymentTextStyleVariant textStyleVariant;
  final VoidCallback? onPressed;
  final MaterialStateProperty<Color> buttonColor;
  final Color borderColor;
  final double borderRadius;
  final double height;
  final double width;
  final double? hitAreaHeight;
  final CrayonPaymentPadding? padding;
  final Either<IconData, String>? icon;
  final double? iconSize;
  final Color? iconColor;
  final bool splash;

  /// Default values
  static final Color _defaultTextColor = Colors.white;
  static final CrayonPaymentTextStyleVariant _textStyleVariant =
      CrayonPaymentTextStyleVariant.headline4;
  static final Color _borderColor = Colors.transparent;
  static final double _width = double.infinity;

  CrayonPaymentDockedButton({
    Key? key,
    Tracker? tracker,
    String? actionName,
    Map<String, dynamic>? trackingParams,
    required this.title,
    Color? textColor,
    CrayonPaymentTextStyleVariant? textStyleVariant,
    required this.onPressed,
    Color? buttonColor,
    Color? borderColor,
    double? borderRadius,
    double? height,
    double? width,
    double? hitAreaHeight,
    this.padding,
    this.icon,
    this.iconSize,
    this.iconColor,
    this.splash = false,
  })  : textColor = textColor ?? _defaultTextColor,
        textStyleVariant = textStyleVariant ?? _textStyleVariant,
        buttonColor = _buildMaterialColor(buttonColor) ??
            _CrayonPaymentDockedButtonBackgroundColor.defaultColor,
        borderColor = borderColor ?? _borderColor,
        borderRadius =
            borderRadius ?? _CrayonPaymentDockedButtonBorderRadius.defaultRadius,
        height = height ?? _CrayonPaymentDockedButtonHeight.defaultHeight,
        width = width ?? _width,
        hitAreaHeight = hitAreaHeight,
        super(
          key: key,
          actionName: actionName,
          tracker: tracker,
          params: trackingParams,
        );

  factory CrayonPaymentDockedButton.outlineGold({
    Key? key,
    required String title,
    required VoidCallback? onPressed,
    double? height,
  }) = _CrayonPaymentDockedButtonOutlineGold;

  factory CrayonPaymentDockedButton.outlineBlack({
    Key? key,
    required String title,
    required VoidCallback? onPressed,
    double? height,
  }) = _CrayonPaymentDockedButtonOutlineBlack;

  factory CrayonPaymentDockedButton.white({
    Key? key,
    required String title,
    required VoidCallback? onPressed,
  }) = _CrayonPaymentDockedButtonWhite;

  factory CrayonPaymentDockedButton.smallBlack({
    Key? key,
    required String title,
    required VoidCallback? onPressed,
  }) = _CrayonPaymentDockedButtonSmallBlack;

  factory CrayonPaymentDockedButton.borderless({
    Key? key,
    required String title,
    required VoidCallback? onPressed,
  }) = _CrayonPaymentDockedButtonBorderless;

  @override
  Widget build(BuildContext context) {
    return hitAreaHeight != null ? _buildWithHitArea() : _buildElevatedButton();
  }

  Widget _buildWithHitArea() {
    return Container(
      height: hitAreaHeight,
      child: _buildElevatedButton(),
    );
  }

  Widget _buildElevatedButton() {
    return Container(
      key: Key('${_identifier}_Container'),
      height: height,
      width: width,
      padding: padding != null ? padding!.toEdgeInsets() : null,
      child: ElevatedButton(
        key: Key('${_identifier}_ElevatedButton'),
        onPressed: () {
          if (onPressed != null) {
            track();
            onPressed!();
          }
        },
        style: ButtonStyle(
          backgroundColor: onPressed == null
              ? _CrayonPaymentDockedButtonBackgroundColor.disabledColor
              : buttonColor,
          splashFactory: splash ? NoSplash.splashFactory : null,
          elevation: _CrayonPaymentDockedButtonDefaultElevation(0),
          shape: _buildShape(borderRadius, borderColor),
        ),
        child: icon != null ? _getIconText() : _getText(),
      ),
    );
  }

  Widget _getText() {
    return CrayonPaymentText(
      key: Key('${_identifier}_Text'),
      text: TextUIDataModel(
        title.tr,
        color: textColor,
        styleVariant: textStyleVariant,
      ),
    );
  }

  Widget _getIconText() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          flex: 1,
          child: Container(
            width: iconSize,
            height: iconSize,
            child: icon!.fold(
              (icon) => Icon(
                icon,
                color: iconColor,
              ),
              (iconPath) => SvgPicture.asset(iconPath),
            ),
          ),
        ),
        spaceW5(),
        Flexible(
          flex: 2,
          child: _getText(),
        ),
      ],
    );
  }

  MaterialStateProperty<OutlinedBorder?>? _buildShape(
    double borderRadius,
    Color borderColor,
  ) {
    return ButtonStyleButton.allOrNull<OutlinedBorder>(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius),
        side: BorderSide(
          color: borderColor,
        ),
      ),
    );
  }
}

@immutable
class _CrayonPaymentDockedButtonDefaultElevation extends MaterialStateProperty<double>
    with Diagnosticable {
  _CrayonPaymentDockedButtonDefaultElevation(this.elevation);

  final double elevation;

  @override
  double resolve(Set<MaterialState> states) {
    return elevation;
  }
}

class _CrayonPaymentDockedButtonOutlineGold extends CrayonPaymentDockedButton {
  _CrayonPaymentDockedButtonOutlineGold({
    Key? key,
    required String title,
    required VoidCallback? onPressed,
    double? height,
  }) : super(
          key: key,
          title: title,
          height: height ?? _CrayonPaymentDockedButtonHeight.smallHeight,
          hitAreaHeight: _CrayonPaymentDockedButtonHeight.defaultHeight,
          textColor: CrayonPaymentColors.crayonPaymentGold,
          onPressed: onPressed,
          buttonColor: Colors.transparent,
          borderColor: CrayonPaymentColors.crayonPaymentGold,
          borderRadius: _CrayonPaymentDockedButtonBorderRadius.smallButtonRadius,
        );
}

class _CrayonPaymentDockedButtonOutlineBlack extends CrayonPaymentDockedButton {
  _CrayonPaymentDockedButtonOutlineBlack({
    Key? key,
    required String title,
    required VoidCallback? onPressed,
    double? height,
  }) : super(
          key: key,
          title: title,
          height: height ?? _CrayonPaymentDockedButtonHeight.smallHeight,
          hitAreaHeight: _CrayonPaymentDockedButtonHeight.defaultHeight,
          textColor: CrayonPaymentColors.crayonPaymentBlack,
          onPressed: onPressed,
          buttonColor: Colors.transparent,
          borderColor: CrayonPaymentColors.crayonPaymentBlack,
          borderRadius: _CrayonPaymentDockedButtonBorderRadius.smallButtonRadius,
        );
}

class _CrayonPaymentDockedButtonSmallBlack extends CrayonPaymentDockedButton {
  _CrayonPaymentDockedButtonSmallBlack({
    Key? key,
    required String title,
    required VoidCallback? onPressed,
  }) : super(
          key: key,
          title: title,
          height: _CrayonPaymentDockedButtonHeight.smallHeight,
          hitAreaHeight: _CrayonPaymentDockedButtonHeight.defaultHeight,
          textColor: Colors.white,
          onPressed: onPressed,
          borderRadius: _CrayonPaymentDockedButtonBorderRadius.smallButtonRadius,
        );
}

class _CrayonPaymentDockedButtonBorderless extends CrayonPaymentDockedButton {
  _CrayonPaymentDockedButtonBorderless({
    Key? key,
    required String title,
    required VoidCallback? onPressed,
  }) : super(
          key: key,
          title: title,
          height: _CrayonPaymentDockedButtonHeight.smallHeight,
          hitAreaHeight: _CrayonPaymentDockedButtonHeight.defaultHeight,
          textColor: CrayonPaymentColors.crayonPaymentGold,
          onPressed: onPressed,
          buttonColor: Colors.transparent,
          borderColor: Colors.transparent,
        );
}

class _CrayonPaymentDockedButtonWhite extends CrayonPaymentDockedButton {
  _CrayonPaymentDockedButtonWhite({
    Key? key,
    required String title,
    required VoidCallback? onPressed,
  }) : super(
          key: key,
          title: title,
          textColor: CrayonPaymentColors.crayonPaymentBlack,
          buttonColor: Colors.white,
          borderColor: CrayonPaymentColors.crayonPaymentBlack,
          onPressed: onPressed,
        );
}

class _CrayonPaymentDockedButtonBackgroundColor {
  static final MaterialStateProperty<Color> disabledColor =
      MaterialStateProperty.all<Color>(CrayonPaymentColors.crayonPaymentLightGray);

  static final MaterialStateProperty<Color> defaultColor =
      MaterialStateProperty.all<Color>(CrayonPaymentColors.crayonPaymentBlack);
}

class _CrayonPaymentDockedButtonHeight {
  static final double defaultHeight = 48.0;

  static final double smallHeight = 32.0;
}

class _CrayonPaymentDockedButtonBorderRadius {
  static final double defaultRadius = 24.0;

  static final double smallButtonRadius = 16.0;
}

MaterialStateProperty<Color>? _buildMaterialColor(Color? buttonColor) {
  if (buttonColor == null) {
    return null;
  }
  return MaterialStateProperty.all<Color>(buttonColor);
}
