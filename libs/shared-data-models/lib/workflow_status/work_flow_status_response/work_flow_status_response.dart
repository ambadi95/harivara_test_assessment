import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'work_flow_status_response.g.dart';

@JsonSerializable()
class WorkFlowStatusResponse extends Equatable {
  final bool? status;
  final String? code;
  final String? message;
  final Data? data;

  const WorkFlowStatusResponse({
    this.status,
    this.code,
    this.message,
    this.data,
  });

  factory WorkFlowStatusResponse.fromJson(Map<String, dynamic> json) {
    return _$WorkFlowStatusResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$WorkFlowStatusResponseToJson(this);

  WorkFlowStatusResponse copyWith({
    bool? status,
    String? code,
    String? message,
    Data? data,
  }) {
    return WorkFlowStatusResponse(
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
