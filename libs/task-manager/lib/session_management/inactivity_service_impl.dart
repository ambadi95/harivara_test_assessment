import 'dart:async';

import 'package:core/logging/logger.dart';
import 'package:core/navigation/navigation_manager.dart';
import 'package:core/navigation/navigation_type.dart';
import 'package:core/session_management/inactivity_service.dart';
import 'package:network_manager/auth/auth_manager.dart';
import 'package:stream_transform/stream_transform.dart';
import 'package:task_manager/task_manager.dart';

class _Constants {
  static const inactivityTimeout = 100 * 60 * 1000; // 10 minutes in milliseconds
  static const storageKey = 'app-inactive-since';
  static const throttleTime = Duration(milliseconds: 1000);
}

/// Service to manage an inactivity timer that will logout the user when triggered.
class InactivityService extends IInactivityService {
  final int inactivityTimeout;
  final TaskManager taskManager;
  final IAuthManager authManager;

  final NavigationManager navigationManager;

  InactivityService({
    required this.taskManager,
    required this.authManager,
    required this.navigationManager,
    this.inactivityTimeout = _Constants.inactivityTimeout,
  }) {
    _init();
  }

  Timer? _inactivityTimer;
  DateTime _inactiveStart = DateTime.now();

  // Internal flag to determine if the timer is considered active
  bool _timerIsActive = true;

  late Duration _inactivityDuration;
  late StreamController<dynamic> _controller;

  // Combines events from a stream and only emits one event during the Duration
  final throttle = StreamTransformer.fromBind(
    (Stream<dynamic> s) => s.throttle(_Constants.throttleTime),
  );

  void _init() {
    _inactivityDuration = Duration(milliseconds: inactivityTimeout);
    _resetTimer(DateTime.now());

    _controller = StreamController();

    _controller.stream.transform<dynamic>(throttle).listen((event) async {
      if (_timerIsActive) {
        _resetTimer(DateTime.now());
      }
    });
  }

  void dispose() {
    _timerIsActive = false;
    _inactivityTimer?.cancel();
    _controller.close();
  }

  @override
  Future<void> movedToBackground() async {
    await taskManager.execute(
      Task(
        requestData: {
          CACHE_TYPE: TaskManagerCacheType.SECURE_SET,
          DATA_KEY: {
            _Constants.storageKey:
                _inactiveStart.microsecondsSinceEpoch.toString(),
          },
        },
        taskType: TaskType.CACHE_OPERATION,
      ),
    );
  }

  @override
  Future<void> movedToForeground() async {
    final result = await taskManager.execute(
      Task(
        requestData: {
          CACHE_TYPE: TaskManagerCacheType.SECURE_GET,
          DATA_KEY: _Constants.storageKey,
        },
        taskType: TaskType.CACHE_OPERATION,
      ),
    ) as Map<String, String?>;

    final time = result[_Constants.storageKey];

    DateTime? dt;
    if (time != null) {
      dt = DateTime.fromMicrosecondsSinceEpoch(int.tryParse(time) ?? 0);
    }

    _resetTimer(dt ?? DateTime.now());
  }

  void _resetTimer(DateTime startTime) {
    _inactivityTimer?.cancel();
    if (startTime.add(_inactivityDuration).isBefore(DateTime.now())) {
      // We've already timed out, perhaps as a result of being resumed.
      _timedOut();
    } else {
      _inactiveStart = startTime;
      _inactivityTimer = Timer(_inactivityDuration, () => _timedOut());
    }
  }

  void _timedOut() async {
    // Perform a 'logout'
    await taskManager.execute(
      Task(
        requestData: {
          CACHE_TYPE: TaskManagerCacheType.MEMORY_CLEAR_ALL,
        },
        taskType: TaskType.CACHE_OPERATION,
      ),
    );

    await navigationManager.navigateTo(
      'src/welcome',
      NavigationType.replaceCurrent(),
    );

    await _logOutUser();

    CrayonPaymentLogger.logInfo(
      'Logging user out as they have not interacted with the screen for ${_Constants.inactivityTimeout} milliseconds',
    );
  }

  @override
  void stopTimer() {
    _inactivityTimer?.cancel();
    _timerIsActive = false;
  }

  @override
  void startTimer() {
    _timerIsActive = true;
    _resetTimer(DateTime.now());
  }

  @override
  void registerInteraction(dynamic event) => _controller.sink.add(event);

  Future<void> _logOutUser() async {
    final isAuthenticatedUser = await authManager.isUserAuthenticated;
    if (isAuthenticatedUser) {
      //TODO Implement Logout
    }
  }
}
