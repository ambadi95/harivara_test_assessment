import 'package:flutter/services.dart';

abstract class LengthTextFormatter extends TextInputFormatter {
  int get getNumberOfDigitsPermitted;
  double get getUpperLimit;
}

class LengthTextFormatterImpl implements LengthTextFormatter {
  final int numberOfDigitsPermitted;
  final double upperLimit;

  LengthTextFormatterImpl({
    required this.numberOfDigitsPermitted,
    required this.upperLimit,
  });

  factory LengthTextFormatterImpl.forMerchantApp() => LengthTextFormatterImpl(
        numberOfDigitsPermitted: 7,
        upperLimit: 250000.0,
      );

  factory LengthTextFormatterImpl.forCustomerApp() => LengthTextFormatterImpl(
        numberOfDigitsPermitted: 6,
        upperLimit: 20000.0,
      );

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final parsedNumber = newValue.text.replaceAll(RegExp('[,]'), '');
    final splittedNumber = parsedNumber.split('.');

    if (parsedNumber.isNotEmpty) {
      if (splittedNumber.length > 1) {
        /// Don't allow to insert a third digit
        if (splittedNumber[1].length > 2) {
          return TextEditingValue(
            text: oldValue.text,
          );
        }
      }

      if (splittedNumber[0].length < numberOfDigitsPermitted) {
        /// Validate the integral part of the number
        return TextEditingValue(
          text: parsedNumber.toString(),
        );
      } else {
        /// Allow last digit when amount exceeds
        /// e.g. current input is 14444 and the limit is 20000. Because 14444
        /// is smaller then 20000, we should allow one more digiti for error validation.
        final integralPart =
            splittedNumber[0].substring(0, splittedNumber[0].length - 1);
        final numOfIntegralPart = double.parse(integralPart);

        return TextEditingValue(
          text: numOfIntegralPart < upperLimit.toInt()
              ? parsedNumber.toString()
              : oldValue.text,
        );
      }
    } else {
      return newValue.copyWith(
        text: '0',
      );
    }
  }

  @override
  int get getNumberOfDigitsPermitted => numberOfDigitsPermitted;

  @override
  double get getUpperLimit => upperLimit;
}
