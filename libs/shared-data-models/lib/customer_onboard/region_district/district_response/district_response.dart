import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'datum.dart';

part 'district_response.g.dart';

@JsonSerializable()
class DistrictResponse extends Equatable {
  final bool? status;
  final String? code;
  final String? message;
  final List<Datum>? data;

  const DistrictResponse({this.status, this.code, this.message, this.data});

  factory DistrictResponse.fromJson(Map<String, dynamic> json) {
    return _$DistrictResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$DistrictResponseToJson(this);

  DistrictResponse copyWith({
    bool? status,
    String? code,
    String? message,
    List<Datum>? data,
  }) {
    return DistrictResponse(
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
