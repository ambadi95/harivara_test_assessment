import 'package:core/mobile_core.dart';
import 'package:core/view/analytics_state_notifier.dart';
import 'package:flutter/material.dart';
import 'package:scanqrcode/viewmodel/scanqrcode_usecase.dart';
import '../navigation_handler/scanqrcode_navigation_handler.dart';
import '../state/scanqrcode_state.dart';

class ScanQRCodeCoordinator extends AnalyticsStateNotifier<ScanQRCodeState> {
  final ScanQRCodeNavigationHandler _navigationHandler;
  final ScanQRCodeUseCase _scanQRCodeUseCase;

  ScanQRCodeCoordinator(
    this._navigationHandler,
    this._scanQRCodeUseCase,
  ) : super(const ScanQRCodeState.initialState());

  void initialiseState(
    BuildContext context,
  ) async {
    state =
        ScanQRCodeState.ready(context: context, error: "", isLoading: false);
  }

  Future<String> getAgentName() async {
    return _scanQRCodeUseCase.getAgentName();
  }
}
