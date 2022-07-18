import 'package:flutter/material.dart';

typedef WidgetContentBuilder<S, T> = Widget Function(
    BuildContext context, S state, T coordinator);

typedef ViewModelSetup<T> = Function(T viewModel);

typedef StateChangeCallback<S> = Function(S? oldState, S newState);
