import 'package:core/validators/validation_rules.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  applyRegexOnMatchingValue();
  applyRegexOnValueNotMatching();
  testNotNullValidationRule();
  testNotEmptyValidationRule();
  testNotEmptyValidationRule();
  testLengthValidationRule();
  testDifferentCharacterRule();
}

void applyRegexOnMatchingValue() {
  test('[RegexStringValidationRule] - apply regex and error is null', () {
    var email = 'test@testEmail.com';
    RegExp regExp = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    var errorMessage = 'This will be the error message';
    RegexStringValidationRule rules =
        RegexStringValidationRule(regExp, errorMessage);

    expect(rules.validate(email), isNull);
  });
}

void applyRegexOnValueNotMatching() {
  test('[RegexStringValidationRule] - apply regex and error is null', () {
    var email = 'test@testEmail';
    RegExp regExp = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    var errorMessage = 'This will be the error message';
    RegexStringValidationRule rules =
        RegexStringValidationRule(regExp, errorMessage);

    expect(rules.validate(email) == errorMessage, isTrue);
  });
}

void testNotNullValidationRule() {
  test('[NotNullValidationRule] - apply not null rule on different types', () {
    var error = 'this should not be null';
    NotNullValidationRule notNullValidationRule = NotNullValidationRule(error);
    expect(notNullValidationRule.validate('notNull'), isNull);
    expect(notNullValidationRule.validate(1), isNull);
    expect(notNullValidationRule.validate(1.0), isNull);
    expect(notNullValidationRule.validate(null) == error, isTrue);
  });
}

void testNotEmptyValidationRule() {
  test('[NotEmptyValidatonRule] - apply not empty validation rule', () {
    var error = 'this should be the error message';
    NotEmptyValidatonRule rule = NotEmptyValidatonRule(error);
    expect(rule.validate('notNull'), isNull);
    expect(rule.validate('') == error, isTrue);
    expect(rule.validate(null) == error, isTrue);
  });
}

void testLengthValidationRule() {
  test(
      '[LengthValidationRule] - apply length validation rule with min max values',
      () {
    var error = 'this should not be null';
    LengthValidationRule rule =
        LengthValidationRule(error, maxLength: 10, minLeght: 1);
    expect(rule.validate('notNull'), isNull);
    expect(rule.validate('n'), isNull);
    expect(rule.validate('1234567890'), isNull);
    expect(rule.validate('123456789011') == error, isTrue);
    expect(rule.validate('') == error, isTrue);
    expect(rule.validate(null) == error, isTrue);
  });
}

void testDifferentCharacterRule() {
  test(
      '[DifferentCharacterRule] - apply different character validation rule with valid string',
      () {
    var error = 'this should not be null';
    DifferentCharactersRule rule = DifferentCharactersRule(error);
    expect(rule.validate('notNull'), isNull);
    expect(rule.validate('n'), isNull);
    expect(rule.validate('1234567890'), isNull);
    expect(rule.validate(''), isNull);
    expect(rule.validate(null), isNull);
    expect(rule.validate('111111111111') == error, isTrue);
    expect(rule.validate('a111111111111'), isNull);
  });
}
