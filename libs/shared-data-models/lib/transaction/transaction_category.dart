import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get/get.dart';
part 'transaction_category.freezed.dart';

@freezed
class TransactionCategory with _$TransactionCategory {
  const TransactionCategory._();

  const factory TransactionCategory.purchase() = PurchaseCategory;

  const factory TransactionCategory.refund() = RefundCategory;

  const factory TransactionCategory.addedFunds() = AddedFundsCategory;

  const factory TransactionCategory.receivedFunds() = ReceivedFundsCategory;

  const factory TransactionCategory.sentFunds() = SentFundsCategory;

  const factory TransactionCategory.subscription() = SubscriptionCategory;

  const factory TransactionCategory.p2m() = P2MCategory;

  const factory TransactionCategory.notAvailable() = NotAvailable;

  factory TransactionCategory.fromString(String transactionCategory) {
    switch (transactionCategory.toLowerCase()) {
      case 'purchase':
        return TransactionCategory.purchase();
      case 'refund':
        return TransactionCategory.refund();
      case 'added funds':
        return TransactionCategory.addedFunds();
      case 'received funds':
        return TransactionCategory.receivedFunds();
      case 'sent funds':
        return TransactionCategory.sentFunds();
      case 'subscription':
        return TransactionCategory.subscription();
      case 'p2m':
        return TransactionCategory.p2m();
      case 'n/a':
        return TransactionCategory.notAvailable();
      default:
        throw UnimplementedError(
          '$transactionCategory not a supported TransactionCategory',
        );
    }
  }

  @override
  String toString() {
    return when(
      purchase: () => 'purchase'.tr,
      refund: () => 'refund'.tr,
      addedFunds: () => 'added-funds'.tr,
      receivedFunds: () => 'received-funds'.tr,
      sentFunds: () => 'sent-funds'.tr,
      subscription: () => 'subscription'.tr,
      p2m: () => 'Purchase',
      notAvailable: () => 'N/A',
    );
  }
}
