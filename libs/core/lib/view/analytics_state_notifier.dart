import 'package:core/analytics/tracker.dart';
import 'package:core/ioc/di_container.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AnalyticsStateNotifier<T> extends StateNotifier<T> implements Tracker {
  final TrackerCollection _trackerCollection;

  AnalyticsStateNotifier(T state, {TrackerCollection? collection})
      : _trackerCollection =
            collection ?? DIContainer.container.resolve<TrackerCollection>(),
        super(state);

  @override
  void trackEvent(String eventName, {Map<String, dynamic>? params}) {
    _trackerCollection.trackEvent(eventName, params: params);
  }

  @override
  void trackScreenClose(String screenName, {Map<String, dynamic>? params}) {
    _trackerCollection.trackScreenClose(screenName, params: params);
  }

  @override
  void trackScreenOpen(String screenName, {Map<String, dynamic>? params}) {
    _trackerCollection.trackScreenOpen(screenName, params: params);
  }

  @override
  void trackScreenDisposed(String screenName, {Map<String, dynamic>? params}) {
    _trackerCollection.trackScreenDisposed(screenName, params: params);
  }
}
