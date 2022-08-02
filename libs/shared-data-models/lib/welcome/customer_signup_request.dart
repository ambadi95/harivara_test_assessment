import 'package:equatable/equatable.dart';

class CustomerSignUpRequest extends Equatable {
  final String? nidaNumber;
  final String? mobileNumber;

  const CustomerSignUpRequest({
    this.nidaNumber,
    this.mobileNumber,
  });

  factory CustomerSignUpRequest.fromJson(Map<String, dynamic> json) =>
      CustomerSignUpRequest(
        nidaNumber: json['nidaNo'] as String?,
        mobileNumber: json['mobileNo'] as String?,
      );

  @override
  List<Object?> get props => [nidaNumber, mobileNumber];
}
