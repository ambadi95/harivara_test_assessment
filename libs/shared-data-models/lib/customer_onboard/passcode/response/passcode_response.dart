import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import '../response/data.dart';
part 'passcode_response.g.dart';

@JsonSerializable()
class PasscodeResponse extends Equatable {
  final bool? status;
  final String? code;
  final String? message;
  final Data? data;

  const PasscodeResponse({this.status, this.code, this.message, this.data});

  factory PasscodeResponse.fromJson(Map<String, dynamic> json) {
    return _$PasscodeResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PasscodeResponseToJson(this);

  PasscodeResponse copyWith({
    bool? status,
    String? code,
    String? message,
    Data? data,
  }) {
    return PasscodeResponse(
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
