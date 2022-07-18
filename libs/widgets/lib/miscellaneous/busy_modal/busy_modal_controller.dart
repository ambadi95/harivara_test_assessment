import 'dart:async';

import 'package:core/ioc/di_container.dart';
import 'package:core/navigation/navigation_manager.dart';
import 'package:core/navigation/navigation_type.dart';

///
/// Controls the display of the BusyModal dialog and is responsible for coordinating
/// the requests to show or hide the dialog.
///
class BusyModalController {
  NavigationManager _navigationManager;
  // Private constructor
  BusyModalController._(this._navigationManager);

  static final BusyModalController _instance = BusyModalController._(
    DIContainer.container.resolve<NavigationManager>(),
  );

  factory BusyModalController() => _instance;

  static const String delayArg = 'busyDelay';

  // Prevent multiple busy modals showing via a usage counter
  int _busyUsageCounter = 0;
  // A non-null timer indicates that the modal is pending and will be shown on timer expiry
  Timer? _delayTimer;
  // The time at which the next busy dialog will show
  DateTime? _willShowAt;
  bool _isShowing = false;

  Future<void> show(int delayInMilliseconds) async {
    _busyUsageCounter += 1;
    if (delayInMilliseconds == 0) {
      // Show dialog with no delay
      _showBusyModal();
    } else {
      _setTimerToShow(delayInMilliseconds);
      // There is a
    }
    return Future.value();
  }

  Future<void> hide(Map<String, dynamic> requestData) async {
    _busyUsageCounter -= 1;
    if (_busyUsageCounter == 0) {
      // If there is a timer running, we need to stop it,
      if (_delayTimer != null) {
        _clearTimer();
      } else {
        _navigationManager.popDialog(arguments: requestData);
      }
      _isShowing = false;
    }
    return Future.value();
  }

  void _clearTimer() {
    _delayTimer?.cancel();
    _delayTimer = null;
    _willShowAt = null;
  }

  void _setTimerToShow(int delay) {
    if (_isShowing) {
      // Already showing, so do nothing.
      return;
    }

    // We have a new delayed modal request, so work out when we will show it
    final showAt = DateTime.now().add(Duration(milliseconds: delay));
    if (_willShowAt == null || _willShowAt!.isAfter(showAt)) {
      print('Will show is $_willShowAt');
      print('Show at   is $showAt');

      _clearTimer();
      // Want to show the modal with a new delay
      _delayTimer = Timer(Duration(milliseconds: delay), () {
        _showBusyModal();
        _clearTimer();
      });
      _willShowAt = showAt;
    }
  }

  void _showBusyModal() {
    if (_isShowing) {
      // Already showing, so do nothing.
      return;
    }
    _isShowing = true;
    _navigationManager.navigateTo(
      'src/busy_modal',
      NavigationType.dialog(),
      barrierDismissiable: false,
      arguments: {},
    );
  }
}
