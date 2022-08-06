import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'dummy_class.g.dart';

@JsonSerializable()
class DummyClass extends Equatable {
  final bool? status;
  final String? code;
  final String? message;
  final Data? data;

  const DummyClass({this.status, this.code, this.message, this.data});

  factory DummyClass.fromJson(Map<String, dynamic> json) {
    return _$DummyClassFromJson(json);
  }

  Map<String, dynamic> toJson() => _$DummyClassToJson(this);

  DummyClass copyWith({
    bool? status,
    String? code,
    String? message,
    Data? data,
  }) {
    return DummyClass(
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
