import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:core/utils/extensions/string_extensions.dart';
import 'package:widget_library/buttons/buttons.dart';
import 'package:widget_library/page_header/text_ui_data_model.dart';
import 'package:widget_library/static_text/crayon_payment_text.dart';
import 'package:widget_library/theme/crayon_payment_theme.dart';
import 'package:widget_library/utils/icon_utils.dart';

/// The standard radius of the rounded box button border
const double _CrayonPaymentcorneredIconButtonBorderRadius = 10.0;

/// The standard height of the rounded box button
const double _CrayonPaymentcorneredIconButtonHeight = 56;

/// The compact height of the rounded box button
const double _CrayonPaymentcorneredIconButtonCompactHeight = 40;

/// The standard width of the rounded box button
const double _CrayonPaymentcorneredIconButtonWidth = 56;

enum ButtonType { icon, text }

class CrayonPaymentCorneredIconButton extends StatelessWidget {
  /// The image of the button displayed in the center
  final String? svgSource;
  final VoidCallback? onPressed;
  final Size? minimumSize;
  final Color? buttonColor;

  /// The variant controls the button colours and can be `primary`, the default,
  /// `secondary` and `tertiary`
  final CrayonPaymentButtonThemeVariant variant;

  /// Supported visual densities are `standard` and `compact` representing the
  /// Large and Small buttons in the design. Note that these do not fallback to
  /// the Material Visual Densities as the design does not follow those
  ///  guidelines.
  final VisualDensity visualDensity;

  /// To Change the button style from the default `rectangular` to `rounded`
  final CrayonPaymentButtonOverlayStyle buttonOverlayStyle;

  final ButtonType buttonType;

  final TextUIDataModel? buttonText;
  final bool isBorderEnabled;

  /// When not specified, the default theme from the context is used
  final String? themeName;

  final Color? foregroundNormalOverwriteColor;
  final Color? borderNormalOverwriteColor;
  final Color? overlayNormalOverwriteColor;
  final Color? backgroundNormalOverwriteColor;
  final ButtonStyle? buttonStyle;

  const CrayonPaymentCorneredIconButton({
    Key? key,
    this.svgSource,
    this.onPressed,
    this.minimumSize,
    this.buttonColor,
    this.variant = CrayonPaymentButtonThemeVariant.primary,
    this.buttonOverlayStyle = CrayonPaymentButtonOverlayStyle.rounded,
    this.visualDensity = VisualDensity.standard,
    this.buttonType = ButtonType.icon,
    this.buttonText,
    this.isBorderEnabled = true,
    this.themeName,
    this.backgroundNormalOverwriteColor,
    this.borderNormalOverwriteColor,
    this.foregroundNormalOverwriteColor,
    this.overlayNormalOverwriteColor,
    this.buttonStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = _getButtonSize();
    return SizedBox(
      width: size.width,
      height: size.height,
      child: ElevatedButton(
        key: key,
        onPressed: onPressed,
        style: buttonStyle ??
            ButtonStyle(
              elevation: _CrayonPaymentRoundedButtonDefaultElevation(0),
              minimumSize: ButtonStyleButton.allOrNull<Size>(size),
              // side: isBorderEnabled ? borderSide : null,
              shape: ButtonStyleButton.allOrNull<OutlinedBorder>(_getBorder()),
            ),
        child: getButtonContent(context),
      ),
    );
  }

  Widget getButtonContent(BuildContext context) =>
      (buttonType == ButtonType.icon) ? _getIcon(context) : _getButtonText();

  Widget _getButtonText() => (buttonText != null) ? CrayonPaymentText(text: buttonText!) : SizedBox.shrink();

  Container _getIcon(BuildContext context) {
    if (svgSource != null) {
      var iconColor = CrayonPaymentTheme().defaultThemeData.actionButtonIconColor.toColor();
      if (buttonStyle != null && buttonStyle!.foregroundColor != null) {
        iconColor = buttonStyle!.foregroundColor!.resolve({MaterialState.selected}) ?? iconColor;
      }
      return Container(
        key: Key('getIcon_Container'),
        width: _getButtonSize().width,
        height: _getButtonSize().height,
        child: Center(
          key: Key('getIcon_Center'),
          child: getSvg(
            svgSource!,
            color: iconColor,
          ),
        ),
      );
    } else {
      return Container(
        key: Key('Container_GetIcon'),
      );
    }
  }

  OutlinedBorder _getBorder() {
    OutlinedBorder border;
    switch (buttonOverlayStyle) {
      case CrayonPaymentButtonOverlayStyle.rounded:
        border = const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(_CrayonPaymentcorneredIconButtonBorderRadius),
          ),
        );
        break;
      default:
        border = const StadiumBorder();
    }
    return border;
  }

  Size _getButtonSize() {
    // Default the button sizes
    var height = minimumSize?.height ?? _CrayonPaymentcorneredIconButtonHeight;
    final width = minimumSize?.width ?? _CrayonPaymentcorneredIconButtonWidth;
    if (height == _CrayonPaymentcorneredIconButtonHeight && visualDensity == VisualDensity.compact) {
      // Adjust the height for the visual density unless it has been
      // overriden by a specific height
      height = _CrayonPaymentcorneredIconButtonCompactHeight;
    }
    return Size(width, height);
  }
}

// @immutable
// class _CrayonPaymentRoundedBoxButtonDefaultBackground extends MaterialStateProperty<Color?> with Diagnosticable {
//   _CrayonPaymentRoundedBoxButtonDefaultBackground(
//     this.primary,
//     this.pressed,
//     this.disabled,
//   );

//   final Color? primary;
//   final Color? pressed;
//   final Color? disabled;

//   @override
//   Color? resolve(Set<MaterialState> states) {
//     if (states.contains(MaterialState.disabled)) {
//       return disabled?.withOpacity(0.2);
//     }
//     if (states.contains(MaterialState.pressed)) {
//       return pressed;
//     }

//     return primary;
//   }
// }



@immutable
class _CrayonPaymentRoundedButtonDefaultElevation extends MaterialStateProperty<double> with Diagnosticable {
  _CrayonPaymentRoundedButtonDefaultElevation(this.elevation);

  final double elevation;

  @override
  double resolve(Set<MaterialState> states) {
    return elevation;
  }
}


