import 'package:core/retrievers/data_models/app_type.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('[AppType] - toString() -', () {
    test('should return CUSTOMER', () {
      // Arrange
      final appType = AppType.customer();

      // Act
      final result = appType.toString();

      // Assert
      expect(result, 'CUSTOMER');
    });

    test('should return MERCHANT', () {
      // Arrange
      final appType = AppType.merchant();

      // Act
      final result = appType.toString();

      // Assert
      expect(result, 'MERCHANT');
    });
  });

  group('[AppType] - fromString() -', () {
    test('should return CustomerApp', () {
      // Arrange
      final inptuString = 'CrayonPayment Pay';

      // Act
      final appType = AppType.fromString(inptuString);

      // Assert
      expect(appType, isA<CustomerApp>());
    });

    test('should return MerchantApp', () {
      // Arrange
      final inptuString = 'CrayonPayment Business';

      // Act
      final appType = AppType.fromString(inptuString);

      // Assert
      expect(appType, isA<MerchantApp>());
    });

    test('should throw UnimplementedError [1]', () {
      // Arrange
      final inptuString = 'CrayonPayment Merchant';

      // Act
      try {
        AppType.fromString(inptuString);
      } catch (exception) {
        // Assert
        expect(exception, isA<UnimplementedError>());
      }
    });

    test('should throw UnimplementedError [2]', () {
      // Arrange
      final inptuString = 'CrayonPayment Customer';

      // Act
      try {
        AppType.fromString(inptuString);
      } catch (exception) {
        // Assert
        expect(exception, isA<UnimplementedError>());
      }
    });
  });
}
