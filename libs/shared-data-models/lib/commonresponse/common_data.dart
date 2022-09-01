import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'common_data.g.dart';

@JsonSerializable()
class Data extends Equatable {
  final String? status;
  final String? data;
  final String? id;
  const Data({this.status, this.data,this.id});

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);

  Data copyWith({
    String? status,
    String? data,
    String? id,
  }) {
    return Data(
      data: data ?? this.data,
      id: id ?? this.id,
      status: status ?? this.status,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [status, data,id];
}
