import 'package:core/ioc/di_container.dart';
import 'package:core/view/builders.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BaseView<T extends StateNotifier<S>, S> extends StatefulWidget {
  final WidgetContentBuilder<S, T> builder;
  final ViewModelSetup<T>? setupViewModel;
  final StateChangeCallback<S>? onStateListenCallback;

  BaseView({
    required this.builder,
    this.setupViewModel,
    this.onStateListenCallback,
  });

  @override
  _BaseViewState<T, S> createState() => _BaseViewState<T, S>();
}

class _BaseViewState<T extends StateNotifier<S>, S>
    extends State<BaseView<T, S>> {
  late AutoDisposeStateNotifierProvider<T, S> _myNotifierProvider;

  late T _coordinator;

  @override
  void initState() {
    _coordinator = DIContainer.container<T>();
    widget.setupViewModel?.call(_coordinator);
    _myNotifierProvider =
        StateNotifierProvider.autoDispose<T, S>((ref) => _coordinator);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(
      key: Key('BaseView_Consumer'),
      builder: (context, ref, child) {
        final state = ref.watch<S>(_myNotifierProvider);
        if (widget.onStateListenCallback != null) {
          ref.listen(_myNotifierProvider, widget.onStateListenCallback!);
        }
        return widget.builder(context, state, _coordinator);
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
