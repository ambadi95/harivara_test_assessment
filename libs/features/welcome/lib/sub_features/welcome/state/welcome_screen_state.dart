import 'package:freezed_annotation/freezed_annotation.dart';

part 'welcome_screen_state.freezed.dart';

@freezed
class WelcomeScreenState with _$WelcomeScreenState {
  const factory WelcomeScreenState({
    @Default('en') String currentLanguageCode,
  }) = _WelcomeScreenState;
}
