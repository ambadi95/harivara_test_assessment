import 'package:core/analytics/tracker.dart';
import 'package:core/logging/logger.dart';

class DefaultTrackerCollection implements TrackerCollection {
  List<Tracker> _criticalTrackers;
  List<Tracker> _optionalTrackers;
  bool _enableOptionalTrackers;

  DefaultTrackerCollection({
    List<Tracker>? critical,
    List<Tracker>? optional,
    bool disableOptionalTrackers = true,
  })  : _criticalTrackers = critical ?? [],
        _optionalTrackers = optional ?? [],
        _enableOptionalTrackers = disableOptionalTrackers;

  @override
  void registerCriticalTrackers(Tracker tracker) {
    _criticalTrackers.add(tracker);
  }

  @override
  void registerOptionalTrackers(Tracker tracker) {
    _optionalTrackers.add(tracker);
  }

  @override
  void toggleOptionalTrackers(bool enable) {
    _enableOptionalTrackers = enable;
  }

  @override
  void trackEvent(String eventName, {Map<String, dynamic>? params}) {
    CrayonPaymentLogger.logDebug('Track event: $eventName. Params: ${params ?? {}}');
    _criticalTrackers.forEach((tracker) {
      tracker.trackEvent(eventName, params: params);
    });
    if (_enableOptionalTrackers) {
      _optionalTrackers.forEach((tracker) {
        tracker.trackEvent(eventName, params: params);
      });
    }
  }

  @override
  void trackScreenOpen(String screenName, {Map<String, dynamic>? params}) {
    CrayonPaymentLogger.logDebug(
        'Track screen open: $screenName. Params: ${params ?? {}}');
    _criticalTrackers.forEach((tracker) {
      tracker.trackScreenOpen(screenName, params: params);
    });
    if (_enableOptionalTrackers) {
      _optionalTrackers.forEach((tracker) {
        tracker.trackScreenOpen(screenName, params: params);
      });
    }
  }

  @override
  void trackScreenClose(String screenName, {Map<String, dynamic>? params}) {
    CrayonPaymentLogger.logDebug(
        'Track screen close: $screenName. Params: ${params ?? {}}');
    _criticalTrackers.forEach((tracker) {
      tracker.trackScreenClose(screenName, params: params);
    });
    if (_enableOptionalTrackers) {
      _optionalTrackers.forEach((tracker) {
        tracker.trackScreenClose(screenName, params: params);
      });
    }
  }

  @override
  void removeTracker(Tracker tracker) {
    _criticalTrackers =
        _criticalTrackers.where((element) => element != tracker).toList();

    _optionalTrackers =
        _optionalTrackers.where((element) => element != tracker).toList();
  }

  @override
  void trackScreenDisposed(String screenName, {Map<String, dynamic>? params}) {
    CrayonPaymentLogger.logDebug(
        'Track screen dispose: $screenName. Params: ${params ?? {}}');
    _criticalTrackers.forEach((tracker) {
      tracker.trackScreenDisposed(screenName, params: params);
    });
    if (_enableOptionalTrackers) {
      _optionalTrackers.forEach((tracker) {
        tracker.trackScreenDisposed(screenName, params: params);
      });
    }
  }
}
