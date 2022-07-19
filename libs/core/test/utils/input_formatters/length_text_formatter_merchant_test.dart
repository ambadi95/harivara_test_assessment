import 'package:core/ioc/di_container.dart';
import 'package:core/utils/input_formatters/length_text_formatter.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  setUp(() {
    DIContainer.container.registerSingleton<LengthTextFormatter>(
      (container) => LengthTextFormatterImpl.forMerchantApp(),
    );
  });

  test('[LengthTextFormatter] - for agent should have the right values',
      () async {
    // Arrange
    final container = DIContainer.container.resolve<LengthTextFormatter>();

    // Assert
    expect(container.getNumberOfDigitsPermitted, 7);
    expect(container.getUpperLimit, 250000.0);
  });
}
