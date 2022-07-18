import 'package:core/ioc/di_container.dart';
import 'package:core/utils/input_formatters/length_text_formatter.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  setUp(() {
    DIContainer.container.registerSingleton<LengthTextFormatter>(
      (container) => LengthTextFormatterImpl.forCustomerApp(),
    );
  });

  test('[LengthTextFormatter] - for customer should have the right values',
      () async {
    // Arrange
    final container = DIContainer.container.resolve<LengthTextFormatter>();

    // Assert
    expect(container.getNumberOfDigitsPermitted, 6);
    expect(container.getUpperLimit, 20000.0);
  });
}
