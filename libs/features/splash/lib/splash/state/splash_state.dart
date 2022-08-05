import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'splash_state.freezed.dart';

@freezed
class SplashState with _$SplashState {
  const factory SplashState.initialState() = InitialState;

  const factory SplashState.ready({
    required BuildContext context,
    required String title,
    required String destinationPath,
  }) = SplashScreenReady;
}
