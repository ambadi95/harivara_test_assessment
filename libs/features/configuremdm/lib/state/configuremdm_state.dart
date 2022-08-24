import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'configuremdm_state.freezed.dart';

@freezed
  class ConfigureMdmState with _$ConfigureMdmState {
  const factory ConfigureMdmState.initialState() = InitialState;
  const factory ConfigureMdmState.ready({
    required BuildContext context,

    @Default('') String error,
    @Default(false) bool isLoading,
  }) = ConfigureMdmStateReady;

}