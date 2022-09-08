import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'device_loan_creation_state.freezed.dart';

@freezed
class DeviceLoanCreationState with _$DeviceLoanCreationState {
  const factory DeviceLoanCreationState.initialState() = InitialState;

  const factory DeviceLoanCreationState.ready({
    required BuildContext context,
    @Default('') String error,
    @Default(false) bool isLoading,

  }) = DeviceLoanCreationStateReady;
}
