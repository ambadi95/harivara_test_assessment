import 'package:freezed_annotation/freezed_annotation.dart';

part 'navigation_type.freezed.dart';

@freezed
class NavigationType with _$NavigationType {
  const factory NavigationType.push() = Push;

  const factory NavigationType.replace() = Replace;

  const factory NavigationType.replaceCurrent() = ReplaceCurrent;

  const factory NavigationType.fullScreenDialog() = FullScreenDialog;

  const factory NavigationType.dialog() = Dialog;

  const factory NavigationType.bottomSheet() = BottomSheet;

  const factory NavigationType.tooltip() = Tooltip;

  const factory NavigationType.popUntil() = PopUntil;
}
