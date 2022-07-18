abstract class Tracker {
  void trackScreenOpen(String screenName, {Map<String, dynamic>? params});

  void trackScreenClose(String screenName, {Map<String, dynamic>? params});

  void trackScreenDisposed(String screenName, {Map<String, dynamic>? params});

  void trackEvent(String eventName, {Map<String, dynamic>? params});
}

abstract class TrackerCollection extends Tracker {
  void registerCriticalTrackers(Tracker tracker);

  void registerOptionalTrackers(Tracker tracker);

  void toggleOptionalTrackers(bool enable);

  void removeTracker(Tracker tracker);
}
