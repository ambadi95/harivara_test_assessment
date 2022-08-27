import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'loan_detail_state.freezed.dart';

@freezed
class LoanDetailState with _$LoanDetailState {
  const factory LoanDetailState.initialState() = InitialState;
  const factory LoanDetailState.ready({
    required BuildContext context,
    @Default('') String error,
    @Default(false) bool isLoading,
  }) = LoanDetailStateReady;
}
