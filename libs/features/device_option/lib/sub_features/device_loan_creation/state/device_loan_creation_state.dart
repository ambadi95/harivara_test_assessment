import 'package:freezed_annotation/freezed_annotation.dart';

part 'device_loan_creation_state.freezed.dart';

@freezed
class DeviceLoanCreationState with _$DeviceCreationLoanState {
  const factory DeviceLoanCreationState.initialState() = InitialState;

}
