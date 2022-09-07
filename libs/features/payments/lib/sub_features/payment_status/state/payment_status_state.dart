import 'package:freezed_annotation/freezed_annotation.dart';

part 'payment_status_state.freezed.dart';

@freezed
class PaymentStatusState with _$PaymentStatusState {
  const factory PaymentStatusState.paymentStatusTimerState({
    required String? timer,
    required String amount,
  }) = PaymentStatusTimerState;
}
