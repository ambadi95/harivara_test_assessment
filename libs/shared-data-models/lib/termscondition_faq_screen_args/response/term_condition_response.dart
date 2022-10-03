import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'data.dart';
part 'term_condition_response.g.dart';

@JsonSerializable()
class TermConditionResponse extends Equatable {
  final bool? status;
  final String? code;
  final String? message;
  final Data? data;

  const TermConditionResponse({
    this.status,
    this.code,
    this.message,
    this.data,
  });

  factory TermConditionResponse.fromJson(Map<String, dynamic> json) {
    return _$TermConditionResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$TermConditionResponseToJson(this);

  TermConditionResponse copyWith({
    bool? status,
    String? code,
    String? message,
    Data? data,
  }) {
    return TermConditionResponse(
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
