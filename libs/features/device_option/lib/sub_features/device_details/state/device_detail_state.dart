import 'package:freezed_annotation/freezed_annotation.dart';

part 'device_detail_state.freezed.dart';

@freezed
class DeviceDetailState with _$DeviceDetailState {
  const factory DeviceDetailState({
    @Default('') String deviceId,
  }) = _DeviceDetailState;
}
