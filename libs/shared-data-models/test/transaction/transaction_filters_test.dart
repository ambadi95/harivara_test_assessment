import 'package:flutter_test/flutter_test.dart';
import 'package:shared_data_models/transaction/transaction_filters.dart';

void main() {
  late TransactionFilters transactionFilters;

  setUp(() {
    transactionFilters = TransactionFilters.filterInput();
  });

  group('transactionFilteModel validation', () {
    testWidgets('validate a JSON', (tester) async {
      //Act
      final result = transactionFilters.toJson();
      //Assert
      expect(result, isA<Map<String, dynamic>>());
    });
  });
}
