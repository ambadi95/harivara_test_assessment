import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get/get.dart';
part 'transaction_type.freezed.dart';

@freezed
class TransactionType with _$TransactionType {
  const TransactionType._();

  const factory TransactionType.debit() = Debit;

  const factory TransactionType.credit() = Credit;

  const factory TransactionType.notAvailable() = TransactionTypeNA;

  factory TransactionType.fromString(String rawString) {
    switch (rawString.toLowerCase()) {
      case 'debit':
        return TransactionType.debit();
      case 'credit':
        return TransactionType.credit();
      case 'n/a':
        return TransactionType.notAvailable();
      default:
        throw UnimplementedError('$rawString not a supported TransactionType');
    }
  }

  @override
  String toString() {
    return when(
      debit: () => 'debit'.tr,
      credit: () => 'credit'.tr,
      notAvailable: () => 'N/A',
    );
  }
}
