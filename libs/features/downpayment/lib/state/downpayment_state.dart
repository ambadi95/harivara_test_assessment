import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'downpayment_state.freezed.dart';

@freezed
class DownPaymentState with _$DownPaymentState {
  const factory DownPaymentState.initialState() = InitialState;
  const factory DownPaymentState.ready({
    required BuildContext context,
    @Default('') String error,
    @Default(false) bool isLoading,
    @Default(false) bool paymentRequested,
    @Default(false) bool waitForPayment,
    @Default(false) bool paymentReceived,
    @Default(false) bool loanApproved,
    @Default(false) bool loanActivated,
  }) = DownPaymentStateReady;
}
