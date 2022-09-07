import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:shared_data_models/kyc/mno_consent_data.dart';

part 'kyc_check_response.g.dart';

@JsonSerializable()
class KycCheckResponse extends Equatable {
  final bool? status;
  final String? code;
  final String? message;
  final Data? data;

  const KycCheckResponse({this.status, this.code, this.message, this.data});

  factory KycCheckResponse.fromJson(Map<String, dynamic> json) {
    return _$KycCheckResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$KycCheckResponseToJson(this);

  KycCheckResponse copyWith({
    bool? status,
    String? code,
    String? message,
    Data? data,
  }) {
    return KycCheckResponse(
      status: status ?? this.status,
      code: code ?? this.code,
      message: message ?? this.message,
      data: data ?? this.data,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [status, code, message, data];
}
