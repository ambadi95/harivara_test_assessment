import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'agent_customer_onboard.g.dart';

@JsonSerializable()
class AgentCustomerOnboard extends Equatable {
  final String? nidaNo;
  final String? mobileNo;
  final String? y9AgentId;

  const AgentCustomerOnboard({this.nidaNo, this.mobileNo, this.y9AgentId});

  factory AgentCustomerOnboard.fromJson(Map<String, dynamic> json) {
    return _$AgentCustomerOnboardFromJson(json);
  }

  Map<String, dynamic> toJson() => _$AgentCustomerOnboardToJson(this);

  AgentCustomerOnboard copyWith({
    String? nidaNo,
    String? mobileNo,
    String? y9AgentId,
  }) {
    return AgentCustomerOnboard(
      nidaNo: nidaNo ?? this.nidaNo,
      mobileNo: mobileNo ?? this.mobileNo,
      y9AgentId: y9AgentId ?? this.y9AgentId,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [nidaNo, mobileNo, y9AgentId];
}
