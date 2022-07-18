import 'package:flutter/material.dart';
import 'keypad_button_type.dart';

class KeypadButton extends StatelessWidget {
  final KeypadButtonType _keypadButtonType;
  final Function(KeypadButtonType) _onButtonPressedCallback;

  KeypadButton(
    this._keypadButtonType,
    this._onButtonPressedCallback, {
    Key? key,
  }) : super(key: key);

  final _textStyle = TextStyle(
    fontSize: 25,
    fontWeight: FontWeight.w500,
    color: Colors.black.withBlue(40),
  );

  @override
  Widget build(BuildContext context) {
    String identifier = _keypadButtonType.toString();
    return Expanded(
      child: InkWell(
        key: Key('keypadButton-${identifier}'),
        onTap: _keypadButtonType != KeypadButtonType.none()
            ? () => _onButtonPressedCallback(_keypadButtonType)
            : null,
        child: Center(child: _getChild),
      ),
    );
  }

  Widget get _getChild {
    return _keypadButtonType.when(
      digit: (number) => Text(
        number.toString(),
        key: const Key('digitText'),
        style: _textStyle,
      ),
      backspace: () => Icon(
        Icons.backspace_rounded,
        color: Color(0xff979797),
        size: 30,
        key: const Key('backspaceIcon'),
      ),
      decimalPoint: () => Text(
        '.',
        style: _textStyle,
        key: const Key('decimalText'),
      ),
      none: () => Text(
        '',
        style: _textStyle,
        key: const Key('decimalText'),
      ),
    );
  }
}
