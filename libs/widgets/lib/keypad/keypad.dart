import 'package:flutter/material.dart';
import 'package:widget_library/keypad/keypad_button_type.dart';

import 'keypad_button.dart';

class KeyPad extends StatelessWidget {
  final Function(KeypadButtonType) _onButtonPressedCallback;

  const KeyPad(
    this._onButtonPressedCallback, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Column(
        key: const Key('keyPad'),
        children: [
          _buildRow([
            KeypadButtonType.digit(1),
            KeypadButtonType.digit(2),
            KeypadButtonType.digit(3),
          ]),
          _buildRow([
            KeypadButtonType.digit(4),
            KeypadButtonType.digit(5),
            KeypadButtonType.digit(6),
          ]),
          _buildRow([
            KeypadButtonType.digit(7),
            KeypadButtonType.digit(8),
            KeypadButtonType.digit(9),
          ]),
          _buildRow([
            KeypadButtonType.decimalPoint(),
            KeypadButtonType.digit(0),
            KeypadButtonType.backspace()
          ]),
        ],
      ),
    );
  }

  Widget _buildRow(List<KeypadButtonType> buttonTypes) {
    return Expanded(
      child: Row(
        children: buttonTypes
            .map(
              (buttonType) =>
                  KeypadButton(buttonType, _onButtonPressedCallback),
            )
            .toList(),
      ),
    );
  }
}
