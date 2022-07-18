import 'package:freezed_annotation/freezed_annotation.dart';

part 'payment_status.freezed.dart';

@freezed
class PaymentStatus with _$PaymentStatus {
  const PaymentStatus._();

  factory PaymentStatus.fromString(String rawString) {
    switch (rawString.toLowerCase().replaceAll(' ', '')) {
      case 'abandoned':
        return PaymentStatus.abandoned();
      case 'authorized':
        return PaymentStatus.authorized();
      case 'cancelled':
        return PaymentStatus.cancelled();
      case 'captured':
        return PaymentStatus.captured();
      case 'cardverified':
        return PaymentStatus.verified();
      case 'declined':
        return PaymentStatus.declined();
      case 'failed':
        return PaymentStatus.failed();
      case 'paid':
        return PaymentStatus.paid();
      case 'pending':
        return PaymentStatus.pending();
      case 'restricted':
        return PaymentStatus.restricted();
      case 'timeout':
        return PaymentStatus.timeout();
      case 'unknown':
        return PaymentStatus.unknown();
      case 'void':
        return PaymentStatus.voidStatus();
      default:
        throw UnimplementedError('$rawString not supported');
    }
  }

  const factory PaymentStatus.abandoned() = Abandoned;

  const factory PaymentStatus.authorized() = Authorized;

  const factory PaymentStatus.cancelled() = Cancelled;

  const factory PaymentStatus.captured() = Captured;

  const factory PaymentStatus.verified() = Verified;

  const factory PaymentStatus.declined() = Declined;

  const factory PaymentStatus.failed() = Failed;

  const factory PaymentStatus.paid() = Paid;

  const factory PaymentStatus.pending() = Pending;

  const factory PaymentStatus.restricted() = Restricted;

  const factory PaymentStatus.timeout() = PaymentTimeout;

  const factory PaymentStatus.unknown() = PaymentUnknown;

  const factory PaymentStatus.voidStatus() = VoidPayment;

  @override
  String toString() {
    return maybeWhen(
      abandoned: () => 'Abandoned',
      authorized: () => 'Authorized',
      cancelled: () => 'Cancelled',
      verified: () => 'CardVerified',
      declined: () => 'Declined',
      failed: () => 'Failed',
      paid: () => 'Paid',
      pending: () => 'Pending',
      restricted: () => 'Restricted',
      timeout: () => 'Timeout',
      unknown: () => 'Unknown',
      voidStatus: () => 'Void',
      orElse: () => 'unknown',
    );
  }
}
