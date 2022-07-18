import 'package:json_annotation/json_annotation.dart';
import 'package:widget_library/helpers/error/helper/error_helper.dart';

part 'error_data_model.g.dart';

@JsonSerializable(explicitToJson: true)
class ErrorData {
  final String packageName;
  final List<ErrorList> errorList;

  ErrorData({
    required this.packageName,
    required this.errorList,
  });

  factory ErrorData.fromJson(Map<String, dynamic> jsonMap) {
    return _$ErrorDataFromJson(jsonMap);
  }

  Map<String, dynamic> toJson() => _$ErrorDataToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ErrorList {
  final String service;
  final List<ErrorNode> items;

  ErrorList({
    required this.service,
    required this.items,
  });

  factory ErrorList.fromJson(Map<String, dynamic> jsonMap) {
    return _$ErrorListFromJson(jsonMap);
  }

  Map<String, dynamic> toJson() => _$ErrorListToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ErrorNode {
  final String code;
  final String type;
  final String? icon;
  final String? title;
  final String? subTitle;
  final String? message;
  final List<ErrorNodeButton>? buttons;
  ErrorNode({
    required this.code,
    required this.type,
    this.icon,
    this.title,
    this.subTitle,
    this.message,
    this.buttons,
  });

  factory ErrorNode.fromJson(Map<String, dynamic> jsonMap) {
    return _$ErrorNodeFromJson(jsonMap);
  }

  Map<String, dynamic> toJson() => _$ErrorNodeToJson(this);

  ErrorNode copyWith({String? message}) => ErrorNode(
        code: code,
        type: type,
        icon: icon,
        title: title,
        subTitle: subTitle,
        message: message ?? this.message,
        buttons: buttons,
      );
}

@JsonSerializable(explicitToJson: true)
class ErrorNodeButton {
  final ErrorButtonType type;
  final String? title;
  ErrorNodeButton({
    required this.type,
    this.title,
  });

  factory ErrorNodeButton.fromJson(Map<String, dynamic> jsonMap) {
    return _$ErrorNodeButtonFromJson(jsonMap);
  }

  Map<String, dynamic> toJson() => _$ErrorNodeButtonToJson(this);
}
