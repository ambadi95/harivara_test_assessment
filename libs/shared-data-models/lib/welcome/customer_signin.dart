import 'package:equatable/equatable.dart';

class CustomerSignUpRequest extends Equatable {
  final String? passcode;
  final String? mobileNumber;

  const CustomerSignUpRequest({
    this.passcode,
    this.mobileNumber,
  });

  factory CustomerSignUpRequest.fromJson(Map<String, dynamic> json) =>
      CustomerSignUpRequest(
        passcode: json['nidaNumber'] as String?,
        mobileNumber: json['mobileNumber'] as String?,
      );

  @override
  List<Object?> get props => [passcode, mobileNumber];
}
