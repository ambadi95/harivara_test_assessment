import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'check_passcode_response.g.dart';

@JsonSerializable()
class CheckPasscodeResponse extends Equatable {
  final bool? status;
  final String? code;
  final String? message;
  final Data? data;

  const CheckPasscodeResponse({
    this.status,
    this.code,
    this.message,
    this.data,
  });

  factory CheckPasscodeResponse.fromJson(Map<String, dynamic> json) {
    return _$CheckPasscodeResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CheckPasscodeResponseToJson(this);

  CheckPasscodeResponse copyWith({
    bool? status,
    String? code,
    String? message,
    Data? data,
  }) {
    return CheckPasscodeResponse(
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
