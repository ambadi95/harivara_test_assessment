class InputEntryValidatorValues {
  final double upperLimit;
  final double lowerLimit;
  final int numberOfDigitsPermitted;

  InputEntryValidatorValues({
    required this.upperLimit,
    required this.numberOfDigitsPermitted,
    this.lowerLimit = 1.0,
  });
}
