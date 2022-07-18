abstract class IValidationRule<T> {
  final String errorMessage;

  IValidationRule(this.errorMessage);

  String? validate(T? toValidate);
}

class RegexStringValidationRule extends IValidationRule<String> {
  final RegExp regExp;

  RegexStringValidationRule(this.regExp, String errorMessage)
      : super(errorMessage);

  @override
  String? validate(String? toValidate) {
    if (toValidate == null) {
      return errorMessage;
    }
    if (regExp.hasMatch(toValidate)) {
      return null;
    }
    return errorMessage;
  }
}

class NotNullValidationRule extends IValidationRule<dynamic> {
  NotNullValidationRule(String errorMessage) : super(errorMessage);

  @override
  String? validate(dynamic toValidate) {
    return toValidate == null ? errorMessage : null;
  }
}

class NotEmptyValidatonRule extends IValidationRule<String> {
  NotEmptyValidatonRule(String errorMessage) : super(errorMessage);

  @override
  String? validate(String? toValidate) {
    return (toValidate?.isEmpty ?? true) ? errorMessage : null;
  }
}

class LengthValidationRule extends IValidationRule<String> {
  final int minLength;
  final int maxLength;

  @override
  String? validate(String? toValidate) {
    if ((toValidate?.length ?? 0) < minLength ||
        (toValidate?.length ?? 0) > maxLength) {
      return errorMessage;
    }
    return null;
  }

  LengthValidationRule(String errorMessage,
      {int minLeght = 0, required this.maxLength})
      : minLength = minLeght,
        super(errorMessage);
}

class DifferentCharactersRule extends IValidationRule<String> {
  DifferentCharactersRule(String errorMessage) : super(errorMessage);

  @override
  String? validate(String? toValidate) {
    if ((toValidate?.length ?? 0) <= 1) {
      return null;
    }
    String newString =
        toValidate!.replaceAll('${toValidate.substring(0, 1)}', '');

    if (newString.isEmpty) {
      return errorMessage;
    }
    return null;
  }
}
