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
    @Default(0) num paymentRequested,
    @Default(0) num createLoan,
    @Default(0) num waitForPayment,
    @Default(0) num paymentReceived,
    @Default(0) num loanApproved,
    @Default(0) num loanActivated,
  }) = DownPaymentStateReady;
}
