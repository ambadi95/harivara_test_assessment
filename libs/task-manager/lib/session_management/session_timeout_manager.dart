import 'dart:async';

import 'package:core/translation/i_app_localization_service.dart';
import 'package:task_manager/task_manager.dart';

import '../task_manager.dart';

class SessionTimeoutManager {
  final TaskManager taskManager;
  final IAppLocalizationService localization;
  static Timer? _timer;

  SessionTimeoutManager({required this.taskManager, required this.localization});

  Future<void> initNewSession(int sessionDuration) async {
    if (_timer != null && _timer!.isActive) {
      _timer!.cancel();
    }
    _timer = Timer(Duration(minutes: sessionDuration), () {
      _timedOut();
    });
  }

  void _timedOut() async {
    var newUserSessionTask = Task(
      moduleIdentifier: 'app_mobile_login',
      taskType: TaskType.USER_SESSION,
      apiIdentifier: 'end_user_session',
      requestData: {
        'show_timeout_message': true,
      },
    );
    await taskManager.execute(newUserSessionTask);
  }
}
