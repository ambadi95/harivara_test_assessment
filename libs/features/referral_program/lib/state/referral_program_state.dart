import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:shared_data_models/referral_program_response/referral_program_list_respobse/referral_list.dart';
part 'referral_program_state.freezed.dart';

@freezed
class ReferralProgramState with _$ReferralProgramState {
  const factory ReferralProgramState({
    @Default(false) bool isLoading,
    @Default(0) int selectedTab,
    @Default("") String mobileNumberError,
    @Default("") String nameError,
    @Default("") String emailError,
    @Default(0) int selectedFilterIndex,
    @Default(0) int yourReferral,
    @Default(0) int onBoarded,
    @Default(0) int yourPoints,
    @Default(0) int inviteFriendsButtonDisabled,
    @Default("ALL") String selectedFilter,
    @Default([]) List<ReferralList> referralList,
  }) = _ReferralProgramState;
}
