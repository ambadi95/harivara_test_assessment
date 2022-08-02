import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'data.g.dart';

@JsonSerializable()
class Data extends Equatable {
	final String? token;
	final String? username;
	final String? lastLoginTime;

	const Data({this.token, this.username, this.lastLoginTime});

	factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

	Map<String, dynamic> toJson() => _$DataToJson(this);

		Data copyWith({
		String? token,
		String? username,
		String? lastLoginTime,
	}) {
		return Data(
			token: token ?? this.token,
			username: username ?? this.username,
			lastLoginTime: lastLoginTime ?? this.lastLoginTime,
		);
	}

	@override
	bool get stringify => true;

	@override
	List<Object?> get props => [token, username, lastLoginTime];
}
