import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'payments_state.freezed.dart';

@freezed
class PaymentsState with _$PaymentsState {
  const factory PaymentsState.initialState() = InitialState;
  const factory PaymentsState.ready({
    required BuildContext context,

    @Default('') String error,
    @Default(false) bool isLoading,
  }) = PaymentsStateReady;

}
