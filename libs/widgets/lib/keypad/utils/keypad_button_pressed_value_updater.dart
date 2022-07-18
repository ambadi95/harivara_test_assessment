import 'package:widget_library/keypad/keypad_button_type.dart';

abstract class KeyPadButtonPressedValueUpdater {
  String updateValue(
    KeypadButtonType buttonTypePressed,
    String previousTotalAmount,
  );
}

class KeyPadButtonPressedValueUpdaterImpl
    implements KeyPadButtonPressedValueUpdater {
  @override
  String updateValue(
    KeypadButtonType buttonTypePressed,
    String previousTotalAmount,
  ) {
    return buttonTypePressed.maybeWhen(
      digit: (number) {
        if (previousTotalAmount.length == 1 && previousTotalAmount[0] == '0') {
          /// Avoid to add zeros in front of number.
          /// e.g. avoid 0008123
          if (number == 0) {
            return previousTotalAmount;
          } else {
            return number.toString();
          }
        }
        return previousTotalAmount += number.toString();
      },
      backspace: () {
        return previousTotalAmount.isNotEmpty
            ? previousTotalAmount.substring(0, previousTotalAmount.length - 1)
            : '';
      },
      decimalPoint: () {
        if (previousTotalAmount.contains('.')) {
          return previousTotalAmount;
        }
        return '$previousTotalAmount.';
      },
      orElse: () => previousTotalAmount,
    );
  }
}
