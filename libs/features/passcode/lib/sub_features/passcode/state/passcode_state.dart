import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shared_data_models/passcode/passcode_verification_type.dart';

part 'passcode_state.freezed.dart';

@freezed
class CreatePasscodeState with _$CreatePasscodeState {
  const factory CreatePasscodeState.initialState() = InitialState;

  const factory CreatePasscodeState.ready({
    required BuildContext context,
    required PassCodeVerificationType passCodeVerificationType,
    required String pageTitle,
    required String pageDescription,
    required String initialPasscode,
    required String currentPasscode,
    required int passcodeLength,
    required int currentStep,
    required String destinationPath,
    @Default('') String error,
    @Default(false) bool isLoading,
  }) = CreatePasscodeReady;

}