import 'package:flutter_riverpod/flutter_riverpod.dart';

class BaseViewModel<S> extends StateNotifier<S> {
  BaseViewModel(S state) : super(state);
}
