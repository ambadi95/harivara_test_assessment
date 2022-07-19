// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'error_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ErrorData _$ErrorDataFromJson(Map<String, dynamic> json) => ErrorData(
      packageName: json['packageName'] as String,
      errorList: (json['errorList'] as List<dynamic>)
          .map((e) => ErrorList.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ErrorDataToJson(ErrorData instance) => <String, dynamic>{
      'packageName': instance.packageName,
      'errorList': instance.errorList.map((e) => e.toJson()).toList(),
    };

ErrorList _$ErrorListFromJson(Map<String, dynamic> json) => ErrorList(
      service: json['service'] as String,
      items: (json['items'] as List<dynamic>)
          .map((e) => ErrorNode.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ErrorListToJson(ErrorList instance) => <String, dynamic>{
      'service': instance.service,
      'items': instance.items.map((e) => e.toJson()).toList(),
    };

ErrorNode _$ErrorNodeFromJson(Map<String, dynamic> json) => ErrorNode(
      code: json['code'] as String,
      type: json['type'] as String,
      icon: json['icon'] as String?,
      title: json['title'] as String?,
      subTitle: json['subTitle'] as String?,
      message: json['message'] as String?,
      buttons: (json['buttons'] as List<dynamic>?)
          ?.map((e) => ErrorNodeButton.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ErrorNodeToJson(ErrorNode instance) => <String, dynamic>{
      'code': instance.code,
      'type': instance.type,
      'icon': instance.icon,
      'title': instance.title,
      'subTitle': instance.subTitle,
      'message': instance.message,
      'buttons': instance.buttons?.map((e) => e.toJson()).toList(),
    };

ErrorNodeButton _$ErrorNodeButtonFromJson(Map<String, dynamic> json) =>
    ErrorNodeButton(
      type: $enumDecode(_$ErrorButtonTypeEnumMap, json['type']),
      title: json['title'] as String?,
    );

Map<String, dynamic> _$ErrorNodeButtonToJson(ErrorNodeButton instance) =>
    <String, dynamic>{
      'type': _$ErrorButtonTypeEnumMap[instance.type]!,
      'title': instance.title,
    };

const _$ErrorButtonTypeEnumMap = {
  ErrorButtonType.SWIPE_UP_TO_CLOSE: 'SWIPE_UP_TO_CLOSE',
  ErrorButtonType.TRY_AGAIN: 'TRY_AGAIN',
  ErrorButtonType.CONTACT_SUPPORT: 'CONTACT_SUPPORT',
};
