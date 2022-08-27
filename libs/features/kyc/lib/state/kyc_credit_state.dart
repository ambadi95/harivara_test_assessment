import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'kyc_credit_state.freezed.dart';

@freezed
class KycCreditState with _$KycCreditState {
  const factory KycCreditState.initialState() = InitialState;
  const factory KycCreditState.ready({
    required BuildContext context,
    @Default('') String error,
    @Default(false) bool isLoading,
  }) = KycCreditStateReady;
}
