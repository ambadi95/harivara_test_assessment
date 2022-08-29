import 'package:freezed_annotation/freezed_annotation.dart';

part 'onboarding_approval_state.freezed.dart';

@freezed
class OnBoardingApprovalState with _$OnBoardingApprovalState {
  const factory OnBoardingApprovalState(
      {@Default(false) bool isValid,
      @Default('') String mobileNumberError,
      @Default('') String referenceIdError,
      @Default(false) bool isLoading}) = _OnBoardingApprovalState;
}
