import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'otherpayment_state.freezed.dart';

@freezed
class OtherPaymentState with _$OtherPaymentState {
  const factory OtherPaymentState.initialState() = InitialState;
  const factory OtherPaymentState.loadingState() = LoadingState;
  const factory OtherPaymentState.ready({
    required BuildContext context,
    @Default('') String error,
    @Default(false) bool isLoading,
    @Default(0) num paymentReceivedOffline,
    @Default(0) num loanApproved,
  }) = OtherPaymentStateReady;

  const factory OtherPaymentState.OtherPaymentFormState(
      bool isValid,
      ) = OtherPaymentFormState;


  const factory OtherPaymentState.transIDError(String nindaNumberError) = transIDError;

  const factory OtherPaymentState.mobileNumberError(String nindaNumberError) = mobileNumberError;
}
