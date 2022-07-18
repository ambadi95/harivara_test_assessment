import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart';
import 'package:shared_data_models/transaction/transactions_filter_type.dart';

void main() {
  final DateFormat _dateFormat = DateFormat('yyyy-MM-dd');
  group('[TransactionsFilterType] - getFilterDates -', () {
    testWidgets('should return one month behind currentDate', (tester) async {
      // Arrange
      final filterType = TransactionsFilterType.previousMonth();

      // Act
      final result = filterType.getFilterDates;

      // Assert
      expect(
        _dateFormat.format(result.endDate),
        _dateFormat.format(DateTime.now()),
      );
      expect(
        _dateFormat.format(result.startDate),
        _dateFormat.format(
          DateTime.now().subtract(
            Duration(days: 30),
          ),
        ),
      );
    });

    testWidgets('should return three months behind currentDate',
        (tester) async {
      // Arrange
      final filterType = TransactionsFilterType.lastThreeMonths();

      // Act
      final result = filterType.getFilterDates;

      // Assert
      expect(
        _dateFormat.format(result.endDate),
        _dateFormat.format(DateTime.now()),
      );
      expect(
        _dateFormat.format(result.startDate),
        _dateFormat.format(
          DateTime.now().subtract(
            Duration(days: 90),
          ),
        ),
      );
    });

    testWidgets('should return one year behind currentDate [1]',
        (tester) async {
      // Arrange
      final filterType = TransactionsFilterType.lastYear();

      // Act
      final result = filterType.getFilterDates;

      // Assert
      expect(
        _dateFormat.format(result.endDate),
        _dateFormat.format(DateTime.now()),
      );
      expect(
        _dateFormat.format(result.startDate),
        _dateFormat.format(
          DateTime.now().subtract(
            Duration(days: 365),
          ),
        ),
      );
    });

    testWidgets('should return one year behind currentDate [2]',
        (tester) async {
      // Arrange
      final filterType = TransactionsFilterType.allTransactions();

      // Act
      final result = filterType.getFilterDates;

      // Assert
      expect(
        _dateFormat.format(result.endDate),
        _dateFormat.format(DateTime.now()),
      );
      expect(
        _dateFormat.format(result.startDate),
        _dateFormat.format(
          DateTime.now().subtract(
            Duration(days: 365),
          ),
        ),
      );
    });
  });
}
