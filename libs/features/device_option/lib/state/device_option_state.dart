import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shared_data_models/agent_nearby/agent_nearby_model.dart';
import 'package:shared_data_models/device_option/device_option_model.dart';

part 'device_option_state.freezed.dart';

@freezed
class DeviceOptionState with _$DeviceOptionState {

 const factory DeviceOptionState({
   @Default([]) List<DeviceOptionModel> DeviceOptionList,
}) = _DeviceOptionState;
}