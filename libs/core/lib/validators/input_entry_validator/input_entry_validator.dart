import 'package:core/validators/input_entry_validator/input_entry_validator_values.dart';
import 'package:get/get.dart';

abstract class InputEntryValidator {
  String? validateAmount(
    String amountToAdd,
    double limit, {
    String? overLimitErrorString,
  });

  bool shouldUpdateUiWithNewValue(String amountToAdd);
}

class InputEntryValidatorImpl implements InputEntryValidator {
  final InputEntryValidatorValues _validatorValues;

  double get _upperLimit => _validatorValues.upperLimit;

  int get _numberOfDigitsPermitted => _validatorValues.numberOfDigitsPermitted;

  double get _minimumAmount => _validatorValues.lowerLimit;

  InputEntryValidatorImpl(this._validatorValues);

  factory InputEntryValidatorImpl.forMerchantApp() => InputEntryValidatorImpl(
        InputEntryValidatorValues(
          numberOfDigitsPermitted: 6,
          upperLimit: 250000.0,
        ),
      );

  factory InputEntryValidatorImpl.forCustomerApp() => InputEntryValidatorImpl(
        InputEntryValidatorValues(
          numberOfDigitsPermitted: 5,
          upperLimit: 20000.0,
        ),
      );

  @override
  String? validateAmount(
    String userInputtedAmount,
    double limit, {
    String? overLimitErrorString,
  }) {
    final updatedAmount = userInputtedAmount.trim().replaceAll(',', '');
    if (updatedAmount == '.') {
      return 'invalid-amount-error'.tr;
    }
    final parsedAmount = double.tryParse(updatedAmount);

    if (parsedAmount == null) {
      return 'invalid-amount-error'.tr;
    }

    if (updatedAmount.isEmpty || parsedAmount < _minimumAmount) {
      return 'needs-to-be-over-1'.tr;
    }

    final amountLimitValue = limit < _upperLimit ? limit : _upperLimit;

    if (parsedAmount > amountLimitValue) {
      return overLimitErrorString ?? 'monthly-limit-error'.tr;
    }
    return null;
  }

  @override
  bool shouldUpdateUiWithNewValue(String amountToAdd) {
    var splitAmount = amountToAdd.split('.');

    if (splitAmount[0].length > 2) {
      /// Added this use case to allow to display a number that exceeds the limit
      /// but before was under the limit (e.g., we have 14,444 as input and
      /// 20,000 limit, when the users enters a new character we have to display
      /// the new number).
      var amount = double.parse(
        splitAmount[0]
            .substring(0, splitAmount[0].length - 1)
            .replaceAll(RegExp('[.,]'), ''),
      );

      if ((splitAmount.length > 1) && (splitAmount[1].length > 2)) {
        return false;
      }

      if (amount < _upperLimit) {
        return true;
      }
    }

    if (amountToAdd.length > 1) {
      return splitAmount[0].length > _numberOfDigitsPermitted ||
              (splitAmount.length > 1 ? splitAmount[1].length : 1) > 2
          ? false
          : true;
    } else {
      return true;
    }
  }
}
