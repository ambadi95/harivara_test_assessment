import 'package:core/analytics/tracker.dart';
import 'package:flutter/cupertino.dart';

abstract class TrackableWidget extends StatelessWidget {
  final Tracker? tracker;
  final String? actionName;
  final Map<String, dynamic>? params;

  const TrackableWidget({
    Key? key,
    this.tracker,
    this.actionName,
    this.params,
  }) : super(key: key);

  void track({Map<String, dynamic>? newParams}) {
    if (newParams != null && (actionName?.isNotEmpty ?? false)) {
      tracker?.trackEvent(actionName!, params: newParams);
    } else if (actionName?.isNotEmpty ?? false) {
      tracker?.trackEvent(actionName!, params: params);
    }
  }
}
