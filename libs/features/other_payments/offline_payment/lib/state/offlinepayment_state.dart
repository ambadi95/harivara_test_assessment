import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'offlinepayment_state.freezed.dart';

@freezed
class OfflinePaymentState with _$OfflinePaymentState {
  const factory OfflinePaymentState.initialState() = InitialState;
  const factory OfflinePaymentState.ready({
    required BuildContext context,
    @Default('') String error,
    @Default(false) bool isLoading,
    @Default(0) num paymentReceivedOffline,
    @Default(0) num loanApproved,
    @Default(0) num loanCreated,
  }) = OfflinePaymentStateReady;
}
