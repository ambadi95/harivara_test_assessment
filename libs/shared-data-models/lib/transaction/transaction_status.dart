import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get/get.dart';

part 'transaction_status.freezed.dart';

@freezed
class TransactionStatus with _$TransactionStatus {
  const TransactionStatus._();

  const factory TransactionStatus.success() = Success;

  const factory TransactionStatus.pending() = Pending;

  const factory TransactionStatus.failed() = Failed;

  const factory TransactionStatus.queued() = Queued;

  const factory TransactionStatus.cancelled() = Cancelled;

  const factory TransactionStatus.notAvailable() = TransactionStatusNA;

  factory TransactionStatus.fromString(String statusMessage) {
    switch (statusMessage.toLowerCase()) {
      case 'success':
        return TransactionStatus.success();
      case 'pending':
        return TransactionStatus.pending();
      case 'failed':
        return TransactionStatus.failed();
      case 'queued':
        return TransactionStatus.queued();
      case 'cancelled':
        return TransactionStatus.cancelled();
      case 'n/a':
        return TransactionStatus.notAvailable();
      default:
        throw UnimplementedError(
          '$statusMessage not a supported TransactionStatus',
        );
    }
  }

  @override
  String toString() {
    return when(
      success: () => 'transaction-status-success'.tr,
      pending: () => 'transaction-status-pending'.tr,
      failed: () => 'transaction-status-failed'.tr,
      queued: () => 'transaction-status-queued'.tr,
      cancelled: () => 'transaction-status-cancelled'.tr,
      notAvailable: () => 'N/A',
    );
  }
}
