import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_type.freezed.dart';

@freezed
class AuthType with _$AuthType {
  const AuthType._();

  factory AuthType.fromString(String rawString) {
    switch (rawString.toLowerCase()) {
      case 'faceid':
        return AuthType.faceId();
      case 'fingerprint':
        return AuthType.fingerPrint();
      case 'mpin':
        return AuthType.mpin();
      case 'pin':
        return AuthType.pin();
      case 'tpin':
        return AuthType.tpin();
      default:
        throw UnimplementedError('$rawString not supported');
    }
  }

  const factory AuthType.faceId() = FaceId;

  const factory AuthType.fingerPrint() = FingerPrint;

  const factory AuthType.mpin() = MPIN;

  const factory AuthType.pin() = PIN;

  const factory AuthType.tpin() = TPIN;

  @override
  String toString() {
    return when(
      faceId: () => 'FACEID',
      fingerPrint: () => 'FINGERPRINT',
      mpin: () => 'MPIN',
      pin: () => 'PIN',
      tpin: () => 'TPIN',
    );
  }
}
