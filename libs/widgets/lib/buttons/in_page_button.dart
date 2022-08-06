import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:widget_library/buttons/buttons.dart';

// TODO: What is the conversion between design pixels and device DPI??
// These are raw pixel sizes from the design

/// The standard height of a button
const double _CrayonPaymentinPageButtonHeight = 56;

/// The compact height of a button
const double _CrayonPaymentinPageButtonHeightCompact = 40;

/// The standard minimum width of material button
/// (hardcoded in [ElevatedButton])
const double _CrayonPaymentinPageButtonWidth = 64;

/// The size of icons in the button
const double _CrayonPaymentinPageButtonIconSize = 36;

///
/// A simple button that follows the design and defaults
/// to a large rectangular variant using the primary colour scheme.
///
class CrayonPaymentInPageButton extends StatelessWidget {
  /// The label for the button. We pass a [String] rather
  /// than a Widget as we want to enforce certain styling
  final String text;
  final VoidCallback? onPressed;
  final Size? minimumSize;

  /// The variant controls the button colours and can be `primary`, the default,
  /// `secondary` and `tertiary`
  final CrayonPaymentButtonThemeVariant variant;

  /// Supported visual densities are `standard` and `compact` representing the
  /// Large and Small buttons in the design. Note that these do not fallback to
  /// the Material Visual Densities as the design does not follow those
  ///  guidelines.
  final VisualDensity visualDensity;

  /// Change the button style from the default `rectangular` to `rounded`
  final CrayonPaymentButtonOverlayStyle buttonStyle;
  final IconData? leadingIcon;
  final IconData? trailingIcon;
  CrayonPaymentInPageButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.minimumSize,
    this.variant = CrayonPaymentButtonThemeVariant.primary,
    this.buttonStyle = CrayonPaymentButtonOverlayStyle.rectangular,
    this.visualDensity = VisualDensity.standard,
    this.leadingIcon,
    this.trailingIcon,
  }) : super(key: key);

  OutlinedBorder _getBorder() {
    OutlinedBorder border;
    switch (buttonStyle) {
      case CrayonPaymentButtonOverlayStyle.rounded:
        border = const StadiumBorder();
        break;
      default:
        border = const RoundedRectangleBorder();
    }
    return border;
  }

  Size _getButtonSize() {
    // Default the button sizes
    var height = minimumSize?.height ?? _CrayonPaymentinPageButtonHeight;
    final width = minimumSize?.width ?? _CrayonPaymentinPageButtonWidth;

    if (height == _CrayonPaymentinPageButtonHeight &&
        visualDensity == VisualDensity.compact) {
      // Adjust the height for the visual density unless it has been
      // overriden by a specific height
      height = _CrayonPaymentinPageButtonHeightCompact;
    }
    return Size(width, height);
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      key: key,
      onPressed: onPressed,
      style: ButtonStyle(
        elevation: _CrayonPaymentInPageButtonDefaultElevation(0),
        minimumSize: ButtonStyleButton.allOrNull<Size>(_getButtonSize()),
        side: ButtonStyleButton.allOrNull<BorderSide>(BorderSide.none),
        shape: ButtonStyleButton.allOrNull<OutlinedBorder>(
          _getBorder(),
        ),
      ),
      child: _ButtonRow(
        text: text,
        leadingIcon: leadingIcon,
        trailingIcon: trailingIcon,
      ),
    );
  }
}

class _ButtonRow extends StatelessWidget {
  final String text;
  final IconData? leadingIcon;
  final IconData? trailingIcon;

  _ButtonRow({
    required this.text,
    this.leadingIcon,
    this.trailingIcon,
  });

  @override
  Widget build(BuildContext context) => Row(
        key: Key('_ButtonRow_Row'),
        mainAxisSize: MainAxisSize.min,
        children: [
          if (leadingIcon != null)
            Icon(
              leadingIcon,
              key: Key('KeyIcon'),
              size: _CrayonPaymentinPageButtonIconSize,
            ),
          // TODO Might need to make these gaps text scaling aware (see the [_ElevatedButtonWithIconChild] code)
          SizedBox(
            key: Key('_ButtonRow_SizedBox'),
            width: leadingIcon != null ? 8 : 0,
          ),

          Text(
            // Might be localisation issues here...
            text.toUpperCase(),
            key: Key('_ButtonRow_Text'),
          ),

          SizedBox(
            key: Key('_ButtonRow_TrailingSizedBox'),
            width: trailingIcon != null ? 8 : 0,
          ),
          if (trailingIcon != null)
            Icon(
              trailingIcon,
              key: Key('_ButtonRow_TrailingIcon'),
              size: _CrayonPaymentinPageButtonIconSize,
            ),
        ],
      );
}

@immutable
class _CrayonPaymentInPageButtonDefaultElevation
    extends MaterialStateProperty<double> with Diagnosticable {
  _CrayonPaymentInPageButtonDefaultElevation(this.elevation);

  final double elevation;

  @override
  double resolve(Set<MaterialState> states) {
    return elevation;
  }
}
