import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'loan_preview_response_model.g.dart';

@JsonSerializable()
class LoanPreviewResponseModel extends Equatable {
  final String? code;
  final Data? data;
  final String? message;
  final bool? status;

  const LoanPreviewResponseModel({
    this.code,
    this.data,
    this.message,
    this.status,
  });

  factory LoanPreviewResponseModel.fromMap(Map<String, dynamic> data) {
    return LoanPreviewResponseModel(
      code: data['code'] as String?,
      data: data['data'] == null
          ? null
          : Data.fromJson(data['data'] as Map<String, dynamic>),
      message: data['message'] as String?,
      status: data['status'] as bool?,
    );
  }


  Map<String, dynamic> toJson() => _$LoanPreviewResponseModelToJson(this);

  LoanPreviewResponseModel copyWith({
    String? code,
    Data? data,
    String? message,
    bool? status,
  }) {
    return LoanPreviewResponseModel(
      code: code ?? this.code,
      data: data ?? this.data,
      message: message ?? this.message,
      status: status ?? this.status,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [code, data, message, status];
}
