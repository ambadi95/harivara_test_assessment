import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:shared_data_models/kyc/mno_consent_data.dart';

part 'mno_consent_response.g.dart';

@JsonSerializable()
class MnoConsentResponse extends Equatable {
  final bool? status;
  final String? code;
  final String? message;
  final Data? data;

  const MnoConsentResponse({this.status, this.code, this.message, this.data});

  factory MnoConsentResponse.fromJson(Map<String, dynamic> json) {
    return _$MnoConsentResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$MnoConsentResponseToJson(this);

  MnoConsentResponse copyWith({
    bool? status,
    String? code,
    String? message,
    Data? data,
  }) {
    return MnoConsentResponse(
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
