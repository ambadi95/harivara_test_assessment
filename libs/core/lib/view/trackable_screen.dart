import 'package:core/ioc/di_container.dart';
import 'package:core/view/analytics_state_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'builders.dart';

class TrackableScreen<T extends AnalyticsStateNotifier<S>, S>
    extends StatefulWidget {
  final WidgetContentBuilder<S, T> builder;
  final ViewModelSetup<T>? setupViewModel;
  final StateChangeCallback<S>? onStateListenCallback;
  final String? screenName;
  final Map<String, dynamic>? trackingParams;

  TrackableScreen({
    required this.builder,
    this.setupViewModel,
    this.onStateListenCallback,
    this.screenName,
    this.trackingParams,
  });

  @override
  State<StatefulWidget> createState() {
    return _TrackableScreenState<T, S>();
  }
}

class _TrackableScreenState<T extends AnalyticsStateNotifier<S>, S>
    extends State<TrackableScreen<T, S>> {
  late AutoDisposeStateNotifierProvider<T, S> _myNotifierProvider;

  late T coordinator;

  @override
  void initState() {
    coordinator = DIContainer.container<T>();
    widget.setupViewModel?.call(coordinator);
    _myNotifierProvider =
        StateNotifierProvider.autoDispose<T, S>((ref) => coordinator);
    super.initState();
    if ((widget.screenName?.isNotEmpty ?? false) && !delayScreenOpenTrack()) {
      coordinator.trackScreenOpen(
        widget.screenName!,
        params: widget.trackingParams,
      );
    }
  }

  bool delayScreenOpenTrack() {
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(
      key: Key('TrackableScreen_Consumer'),
      builder: (context, ref, child) {
        final state = ref.watch<S>(_myNotifierProvider);
        if (widget.onStateListenCallback != null) {
          ref.listen(_myNotifierProvider, widget.onStateListenCallback!);
        }
        return widget.builder(context, state, coordinator);
      },
    );
  }

  @override
  void dispose() {
    if (widget.screenName?.isNotEmpty ?? false) {
      coordinator.trackScreenDisposed(
        widget.screenName!,
        params: widget.trackingParams,
      );
    }
    super.dispose();
  }
}
