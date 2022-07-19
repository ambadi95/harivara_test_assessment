import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shared_data_models/transaction/transaction_type.dart';

part 'transaction_filters.freezed.dart';

@freezed
class TransactionFilters with _$TransactionFilters {
  const TransactionFilters._();

  const factory TransactionFilters.filterInput({
    DateTime? endDate,
    DateTime? startDate,
    @Default('12') String walletId,
    @Default('COMPLETED') String operationType,
    @Default(null) TransactionType? transactionsType,
    @Default(1) int pageNo,
    @Default(10) int size,
  }) = FilterInput;

  Map<String, dynamic> toJson() {
    final transactionRequest = {
      'fromDate': startDate == null
          ? DateTime.now()
          : DateTime.now(),
      'operationType': operationType,
      'pageNo': pageNo,
      'size': size,
      'toDate': endDate == null
          ? DateTime.now().subtract(Duration(days: 365))
          : DateTime.now(),
      'walletId': walletId,
    };

    if (transactionsType != null) {
      transactionsType!.when(
        debit: () => transactionRequest['transactionsType'] = 'IN',
        credit: () => transactionRequest['transactionsType'] = 'OUT',
        notAvailable: () {},
      );
    }

    return {'options': transactionRequest};
  }
}
