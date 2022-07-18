import 'package:flutter/material.dart';
import 'package:widget_library/input_fields/obscured_field.dart';

class ObscuredDigitEntryInputField extends StatelessWidget {
  final int _numOfCharacters;
  final String _currentInput;

  ObscuredDigitEntryInputField(
    this._numOfCharacters,
    this._currentInput, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      key: const Key('row'),
      children: _returnFields,
    );
  }

  List<Widget> get _returnFields {
    List<Widget> widgets = [];
    for (var i = 0; i < _numOfCharacters; i++) {
      widgets.add(
        ObscuredField(
          value: _getValue(i),
          shouldBeFocused:
              i == _currentInput.length || (_currentInput.isEmpty && i == 0),
        ),
      );
    }
    return widgets;
  }

  String _getValue(int i) {
    if (_currentInput.length > i) {
      final value = _currentInput[i];
      return value == _currentInput[_currentInput.length - 1] &&
              i == _currentInput.length - 1
          ? value
          : '*';
    }
    return '';
  }
}
