import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'organisation_type_list_response.g.dart';

@JsonSerializable()
class OrganisationTypeListResponse extends Equatable {
  final bool? status;
  final String? code;
  final String? message;
  final List<String>? data;

  const OrganisationTypeListResponse({
    this.status,
    this.code,
    this.message,
    this.data,
  });

  factory OrganisationTypeListResponse.fromJson(Map<String, dynamic> json) {
    return _$OrganisationTypeListResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$OrganisationTypeListResponseToJson(this);

  OrganisationTypeListResponse copyWith({
    bool? status,
    String? code,
    String? message,
    List<String>? data,
  }) {
    return OrganisationTypeListResponse(
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
