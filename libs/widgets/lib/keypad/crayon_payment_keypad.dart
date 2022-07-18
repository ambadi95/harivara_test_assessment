import 'package:flutter/material.dart';
import 'package:widget_library/buttons/text_button.dart';
import 'package:widget_library/keypad/keypad.dart';
import 'package:widget_library/keypad/keypad_button_type.dart';

import 'keypad_button.dart';

class CrayonPaymentKeyPad extends KeyPad {
  final BuildContext context;
  final Function(KeypadButtonType p1) onButtonPressedCallback;
  final Function? cancelButtonCallback;
  final Function? doneButtonCallback;
  final bool? hasActionButton;

  CrayonPaymentKeyPad(
    this.context,
    this.onButtonPressedCallback, {
    Key? key,
    this.cancelButtonCallback,
    this.doneButtonCallback,
    this.hasActionButton,
  }) : super(onButtonPressedCallback, key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      key: const Key('keyPad'),
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        if (hasActionButton != null && hasActionButton!)
          Container(height: 1, color: Color(0xffF6F5F2)),
        if (hasActionButton != null && hasActionButton!)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CrayonPaymentTextButton(
                  text: 'cancel',
                  textStyle: const TextStyle(
                    color: Color(0xff937206),
                    fontSize: 16,
                    height: 1.5,
                  ),
                  onPressed: _onCancelPressed,
                ),
                CrayonPaymentTextButton(
                  text: 'done',
                  textStyle: const TextStyle(
                    color: Color(0xff937206),
                    fontSize: 16,
                    height: 1.5,
                  ),
                  onPressed: _onDonePressed,
                )
              ],
            ),
          ),
        if (hasActionButton != null && hasActionButton!)
          Container(height: 1, color: Color(0xffF6F5F2)),
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
          KeypadButtonType.none(),
          KeypadButtonType.digit(0),
          KeypadButtonType.backspace()
        ]),
      ],
    );
  }

  Widget _buildRow(List<KeypadButtonType> buttonTypes) {
    return Expanded(
      child: Container(
        child: Row(
          children: buttonTypes
              .map(
                (buttonType) => KeypadButton(
                  buttonType,
                  onButtonPressedCallback,
                ),
              )
              .toList(),
        ),
      ),
    );
  }

  void _onCancelPressed() {
    if (cancelButtonCallback != null) {
      cancelButtonCallback!();
      FocusScope.of(context).unfocus();
    }
  }

  void _onDonePressed() {
    if (doneButtonCallback != null) {
      doneButtonCallback!();
      FocusScope.of(context).unfocus();
    }
  }
}
