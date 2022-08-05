import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'datum.dart';

part 'region_details.g.dart';

@JsonSerializable()
class RegionDetails extends Equatable {
  final bool? status;
  final String? code;
  final String? message;
  final List<Datum>? data;

  const RegionDetails({this.status, this.code, this.message, this.data});

  factory RegionDetails.fromJson(Map<String, dynamic> json) {
    return _$RegionDetailsFromJson(json);
  }

  Map<String, dynamic> toJson() => _$RegionDetailsToJson(this);

  RegionDetails copyWith({
    bool? status,
    String? code,
    String? message,
    List<Datum>? data,
  }) {
    return RegionDetails(
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
