import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_screen_state.freezed.dart';

@freezed
class HomeScreenState with _$HomeScreenState {
  const factory HomeScreenState.initialState() = InitialState;
  const factory HomeScreenState.ready({
    required BuildContext context,

    @Default('') String error,
    @Default(false) bool isAgent,
    @Default(false) bool isLoading,
  }) = HomeScreenReady;
}