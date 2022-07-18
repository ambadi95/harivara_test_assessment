import 'package:freezed_annotation/freezed_annotation.dart';

part 'passcode_attempt_type.freezed.dart';

@freezed
class PasscodeAttemptType with _$PasscodeAttemptType {
  const PasscodeAttemptType._();

  factory PasscodeAttemptType.changeAttempt(PasscodeAttemptType attemptType) {
    return attemptType.when(
      initialAttempt: () => PasscodeAttemptType.firstAttempt(),
      firstAttempt: () => PasscodeAttemptType.secondAttempt(),
      secondAttempt: () => PasscodeAttemptType.thirdAttempt(),
      thirdAttempt: () => PasscodeAttemptType.thirdAttempt(),
    );
  }

  const factory PasscodeAttemptType.initialAttempt() = InitialAttempt;

  const factory PasscodeAttemptType.firstAttempt() = FirstAttempt;

  const factory PasscodeAttemptType.secondAttempt() = SecondAttempt;

  const factory PasscodeAttemptType.thirdAttempt() = ThirdAttempt;
}
