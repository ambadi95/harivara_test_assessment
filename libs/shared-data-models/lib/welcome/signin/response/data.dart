import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'data.g.dart';

@JsonSerializable()
class Data extends Equatable {
	final String? token;
	final String? username;
	final String? lastLoginTime;
	final String? id;

	const Data({this.token, this.username, this.lastLoginTime, this.id});

	factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

	Map<String, dynamic> toJson() => _$DataToJson(this);

		Data copyWith({
		String? token,
		String? username,
		String? lastLoginTime,
			String? id,
	}) {
		return Data(
			token: token ?? this.token,
			username: username ?? this.username,
			lastLoginTime: lastLoginTime ?? this.lastLoginTime,
			id: id ?? this.id,
		);
	}

	@override
	bool get stringify => true;

	@override
	List<Object?> get props => [token, username, lastLoginTime, id];
}
