import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'auth_detail.g.dart';

@JsonSerializable()
class AuthDetail extends Equatable {
  final String? image;
  final String? id;
  final String? mobile;
  final String? name;

  const AuthDetail({this.image, this.id, this.mobile, this.name});

  factory AuthDetail.fromJson(Map<String, dynamic> json) {
    return _$AuthDetailFromJson(json);
  }

  Map<String, dynamic> toJson() => _$AuthDetailToJson(this);

  AuthDetail copyWith({
    String? image,
    String? id,
    String? mobile,
    String? name,
  }) {
    return AuthDetail(
      image: image ?? this.image,
      id: id ?? this.id,
      mobile: mobile ?? this.mobile,
      name: name ?? this.name,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [image, id, mobile, name];
}

enum UserDetailsLabel { image, id, mobile, name }
