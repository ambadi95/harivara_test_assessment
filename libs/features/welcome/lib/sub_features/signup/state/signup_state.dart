import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shared_data_models/customer_onboard/payment_mode_list_respose/payment_mode_list_response/datum.dart';

part 'signup_state.freezed.dart';

@freezed
class SignUpState with _$SignUpState {
  const factory SignUpState.initialState() = InitialState;

  const factory SignUpState.loadingState() = LoadingState;

  const factory SignUpState.SignUpFormState(
    bool isValid,
  ) = SignUpFormState;

  const factory SignUpState.nindaNumberError(String nindaNumberError) =
      NindaNumberError;

  const factory SignUpState.mobileNumberError(String nindaNumberError) =
      MobileNumberError;

  const factory SignUpState.agentIdError(String agentIdError) = AgentIdError;

  const factory SignUpState.paymentModeError(String paymentModeError) =
  PaymentModeError;


  const factory SignUpState.onPaymentModeChoosen(Datum paymentMode) = PaymentModeChoosen;
}
