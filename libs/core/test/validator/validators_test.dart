import 'package:core/validators/validation_rules.dart';
import 'package:core/validators/validator.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testValidationRuleSingleValidation();
  testValidationRuleSingleValidationNoError();
  testValidationRuleAllValidation();
  testValidationRuleAllValidationNoErrors();
}

void testValidationRuleSingleValidation() {
  test('[Validator] - returns single and first error found', () {
    Validator validator = Validator(rules: [
      NotNullValidationRule('This is null'),
      NotEmptyValidatonRule('This is empty')
    ]);

    String? error = validator.checkFirst(null);

    expect(error == 'This is null', isTrue);
  });
}

void testValidationRuleSingleValidationNoError() {
  test('[Validator] - returns single and first error found', () {
    Validator validator = Validator(rules: [
      NotNullValidationRule('This is null'),
      NotEmptyValidatonRule('This is empty')
    ]);

    String? error = validator.checkFirst('test check');

    expect(error, isNull);
  });
}

void testValidationRuleAllValidation() {
  test('[Validator] - returns all errors found', () {
    Validator validator = Validator(rules: [
      NotNullValidationRule('This is null'),
      NotEmptyValidatonRule('This is empty')
    ]);

    List<String?> errors = validator.checkAll(null);

    expect(errors, contains('This is null'));
    expect(errors, contains('This is empty'));
    expect(errors, hasLength(2));
  });
}

void testValidationRuleAllValidationNoErrors() {
  test('[Validator] - returns all errors found', () {
    Validator validator = Validator(rules: [
      NotNullValidationRule('This is null'),
      NotEmptyValidatonRule('This is empty')
    ]);

    List<String?> errors = validator.checkAll('not null value');

    expect(errors, isEmpty);
  });
}
