import 'package:freezed_annotation/freezed_annotation.dart';

part 'keypad_button_type.freezed.dart';

@freezed
class KeypadButtonType with _$KeypadButtonType {
  const KeypadButtonType._();

  const factory KeypadButtonType.digit(int number) = KeypadDigit;

  const factory KeypadButtonType.backspace() = KeypadBackSpace;

  const factory KeypadButtonType.decimalPoint() = KeypadDecimalPoint;

  const factory KeypadButtonType.none() = KeypadNone;

  @override
  String toString() {
    return when(
      digit: (number) => number.toString(),
      backspace: () => 'backspace',
      decimalPoint: () => 'decimalPoint',
      none: () => 'none',
    );
  }
}
