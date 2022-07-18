import 'package:core/validators/validation_rules.dart';

class Validator<T> {
  final List<IValidationRule<T>> rules;

  const Validator({
    required this.rules,
  });

  String? checkFirst(T valid) {
    for (var i = 0; i < rules.length; i++) {
      var error = rules[i].validate(valid);
      if (error != null) {
        return error;
      }
    }
    return null;
  }

  List<String> checkAll(T valid) {
    return rules
        .map((e) => e.validate(valid))
        .where((element) => element != null)
        .map((e) => e!)
        .toList();
  }
}
