import 'package:core/retrievers/app_info_retriever.dart';
import 'package:core/retrievers/data_models/app_type.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('[AppInfoRetriever] - constructor -', () {
    test('should have CustomerApp for appType', () {
      // Arrange
      final appInfoRetriever = AppInfoRetrieverImpl.customerApp();

      // Assert
      expect(appInfoRetriever.appType, isA<CustomerApp>());
    });

    test('should have MerchantApp for appType', () {
      // Arrange
      final appInfoRetriever = AppInfoRetrieverImpl.merchantApp();

      // Assert
      expect(appInfoRetriever.appType, isA<MerchantApp>());
    });
  });
}
