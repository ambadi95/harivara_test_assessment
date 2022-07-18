import 'package:core/navigation/navigation_type.dart';
import 'package:flutter/cupertino.dart';

class NavigationDetails<T, R> {
  final String? popToPath;
  final String pushPath;
  final NavigationType pushType;
  final NavigationType popType;
  final T? pushArguments;
  final R? otherArguments;
  final ValueChanged<R>? onPopCallback;

  const NavigationDetails({
    this.popToPath,
    required this.pushPath,
    required this.pushType,
    required this.popType,
    this.pushArguments,
    this.otherArguments,
    this.onPopCallback,
  });

  //ignore: long-parameter-list
  NavigationDetails<T, R> copyWith({
    String? popToPath,
    String? pushPath,
    NavigationType? pushType,
    NavigationType? popType,
    T? pushArguments,
    ValueChanged<R>? onPopCallback,
    R? otherArguments,
  }) {
    return NavigationDetails(
      popToPath: popToPath ?? this.popToPath,
      pushPath: pushPath ?? this.pushPath,
      pushType: pushType ?? this.pushType,
      popType: popType ?? this.popType,
      pushArguments: pushArguments ?? this.pushArguments,
      otherArguments: otherArguments ?? this.otherArguments,
      onPopCallback: onPopCallback ?? this.onPopCallback,
    );
  }
}
