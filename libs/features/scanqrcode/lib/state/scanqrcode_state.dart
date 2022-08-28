import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'scanqrcode_state.freezed.dart';

@freezed
class ScanQRCodeState with _$ScanQRCodeState {
  const factory ScanQRCodeState.initialState() = InitialState;
  const factory ScanQRCodeState.ready({
    required BuildContext context,

    @Default('') String error,
    @Default(false) bool isLoading,
  }) = ScanQRCodeStateReady;

}
