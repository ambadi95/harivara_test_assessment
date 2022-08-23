import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'kyc_credit_main_state.freezed.dart';

@freezed
class KycCreditMainState with _$KycCreditMainState {
  const factory KycCreditMainState.initialState() = InitialState;
  const factory KycCreditMainState.ready({
    required BuildContext context,
    @Default('') String error,
    @Default(false) bool isLoading,
  }) = KycCreditMainStateReady;
}
