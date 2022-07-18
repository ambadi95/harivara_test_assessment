import 'package:freezed_annotation/freezed_annotation.dart';

part 'transactions_filter_type.freezed.dart';

@freezed
class TransactionsFilterType with _$TransactionsFilterType {
  const TransactionsFilterType._();

  const factory TransactionsFilterType.previousMonth() = PreviousMonth;

  const factory TransactionsFilterType.lastThreeMonths() = LastThreeMotnhs;

  const factory TransactionsFilterType.lastYear() = LastYear;

  const factory TransactionsFilterType.allTransactions() = AllTransactions;

  const factory TransactionsFilterType.selectDates({
    required DateTime endDate,
    required DateTime startDate,
  }) = SelectDates;

  TransactionsFilterDates get getFilterDates => when(
        previousMonth: () => TransactionsFilterDates(
          endDate: DateTime.now(),
          startDate: DateTime.now().subtract(
            Duration(days: 30),
          ),
        ),
        lastThreeMonths: () => TransactionsFilterDates(
          endDate: DateTime.now(),
          startDate: DateTime.now().subtract(
            Duration(days: 90),
          ),
        ),
        lastYear: () => TransactionsFilterDates(
          endDate: DateTime.now(),
          startDate: DateTime.now().subtract(
            Duration(days: 365),
          ),
        ),
        allTransactions: () => TransactionsFilterDates(
          endDate: DateTime.now(),
          startDate: DateTime.now().subtract(
            Duration(days: 365),
          ),
        ),
        selectDates: (endDate, startDate) => TransactionsFilterDates(
          endDate: endDate,
          startDate: startDate,
        ),
      );
}

class TransactionsFilterDates {
  final DateTime startDate;
  final DateTime endDate;

  TransactionsFilterDates({required this.startDate, required this.endDate});
}
