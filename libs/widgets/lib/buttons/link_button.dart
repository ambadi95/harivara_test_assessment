import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:widget_library/buttons/buttons.dart';

/// A button that has simple styling and changes colour when pressed.
///
///
// Karl's note: We don't utilise the [CrayonPaymentInPlaceButton] with a new style, as the text underline
// does not change colour with the button press as required by the design. Tried a few ways of getting that to
// work, e.g. underline via a Decorated Container, using the underline [TextStyle], etc. but no solution changed the underline
// colour when the button was pressed.
class CrayonDataLinkButton extends StatefulWidget {
  late final String text;
  final VoidCallback? onPressed;

  /// The variant controls the button colours and can be `primary`, the default,
  /// `secondary` and `tertiary`
  final CrayonPaymentButtonThemeVariant variant;

  CrayonDataLinkButton({
    Key? key,
    required String text,
    required this.onPressed,
    this.variant = CrayonPaymentButtonThemeVariant.primary,
  }) : super(key: key) {
    this.text = text.toUpperCase();
  }

  @override
  State<StatefulWidget> createState() => _CrayonDataLinkButtonState();
}

class _CrayonDataLinkButtonState extends State<CrayonDataLinkButton> {
  // Left here for future use
  // ignore: unused_field
  var _isPressed = false;

  bool get _isDisabled => widget.onPressed == null;
  bool get _isNotDisabled => !_isDisabled;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      key: Key('_CrayonPaymentLinkButton_GestureDetector'),
      onTapDown: (details) =>
          setState(() => _isPressed = true && _isNotDisabled),
      onTapUp: (details) => setState(() => _isPressed = false),
      onTapCancel: () => setState(() => _isPressed = false),
      onTap: widget.onPressed,
      child: Container(
        key: Key('_CrayonPaymentLinkButton_Container'),
        decoration: BoxDecoration(
          border: Border(),
        ),
        child: Text(
          widget.text.toUpperCase(),
          key: Key('_CrayonPaymentLinkButton_Text'),
        ),
      ),
    );
  }
}
