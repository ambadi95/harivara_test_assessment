// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'agent_sign_in.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AgentSignIn _$AgentSignInFromJson(Map<String, dynamic> json) => AgentSignIn(
      mobileNumber: json['mobileNumber'] as String?,
      passcode: json['passcode'] as String?,
      y9AgentId: json['y9AgentId'] as String?,
    );

Map<String, dynamic> _$AgentSignInToJson(AgentSignIn instance) =>
    <String, dynamic>{
      'mobileNumber': instance.mobileNumber,
      'passcode': instance.passcode,
      'y9AgentId': instance.y9AgentId,
    };
