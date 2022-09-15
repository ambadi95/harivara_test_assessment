import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';


@freezed
class OtherPaymentState with _$OtherPaymentState {
  const factory OtherPaymentState.initialState() = InitialState;
  const factory OtherPaymentState.ready({
    required BuildContext context,
    @Default('') String error,
    @Default(false) bool isLoading,
    @Default(0) num paymentReceivedOffline,
    @Default(0) num loanApproved,
  }) = OtherPaymentStateReady;
}
