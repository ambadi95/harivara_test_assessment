import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class BaseView<T extends ChangeNotifier> extends StatefulWidget {
  final Widget Function(BuildContext context, T value, Widget? child) builder;
  final Function(T) onModelReady;
  T instanceModel;
  BaseView(
      {super.key, required this.builder,
        required this.onModelReady,
        required this.instanceModel});
  @override
  _BaseViewState<T> createState() => _BaseViewState<T>();
}

class _BaseViewState<T extends ChangeNotifier> extends State<BaseView<T>> {
  late T model;
  @override
  void initState() {
    model = widget.instanceModel;
    if (widget.onModelReady != null) {
      widget.onModelReady(model);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>(
      create: (context) => model,
      child: Consumer<T>(builder: widget.builder),
    );
  }
}
