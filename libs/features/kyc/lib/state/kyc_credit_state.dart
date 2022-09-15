import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'kyc_credit_state.freezed.dart';

@freezed
class KycCreditState with _$KycCreditState {
  const factory KycCreditState.initialState() = InitialState;
  const factory KycCreditState.ready({
    required BuildContext context,
    @Default('') String error,
    @Default(false) bool isKycCheckSuccess,
    @Default(false) bool isKycError,
    @Default(false) bool isCreditCheckError,
    @Default(false) bool isLoading,
    @Default(false) bool isKycPassEnabledByManual,
    @Default(false) bool isCreditCheckEnabledByManual
  }) = KycCreditStateReady;
}
