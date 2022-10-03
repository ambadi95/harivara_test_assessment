import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'termscondition_state.freezed.dart';

@freezed
class TermsConditionState with _$TermsConditionState {
  const factory TermsConditionState.initialState() = InitialState;
  const factory TermsConditionState.ready({
    required BuildContext context,
    @Default('') String error,
    @Default(false) bool isLoading,
  }) = TermsConditionStateReady;
}
