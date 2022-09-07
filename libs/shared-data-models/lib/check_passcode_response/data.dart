import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'data.g.dart';

@JsonSerializable()
class Data extends Equatable {
  final bool? passcodeSet;

  const Data({this.passcodeSet});

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);

  Data copyWith({
    bool? passcodeSet,
  }) {
    return Data(
      passcodeSet: passcodeSet ?? this.passcodeSet,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [passcodeSet];
}
