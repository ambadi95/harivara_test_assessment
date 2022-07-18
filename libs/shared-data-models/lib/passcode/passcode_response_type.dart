import 'package:freezed_annotation/freezed_annotation.dart';

part 'passcode_response_type.freezed.dart';

@freezed
class PasscodeResponseType with _$PasscodeResponseType {
  const PasscodeResponseType._();

  factory PasscodeResponseType.fromString(String rawString) {
    switch (rawString.toLowerCase()) {
      case 'success':
        return PasscodeResponseType.success();
      case 'failure':
        return PasscodeResponseType.failure();
      default:
        return PasscodeResponseType.failure();
    }
  }

  const factory PasscodeResponseType.success() = PasscodeResponseSuccess;

  const factory PasscodeResponseType.failure() = PasscodeResponseFailure;

  @override
  String toString() {
    return maybeWhen(
      success: () => 'Success',
      failure: () => 'Failure',
      orElse: () => 'unknown',
    );
  }
}
