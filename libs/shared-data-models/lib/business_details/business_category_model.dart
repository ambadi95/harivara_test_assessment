import 'package:equatable/equatable.dart';

class BusinessCategoryModel extends Equatable {
  const BusinessCategoryModel(this.key, this.value);

  final String key;
  final String value;

  factory BusinessCategoryModel.fromJson(Map<String, dynamic> json) =>
      BusinessCategoryModel(
        json['key'],
        json['value'],
      );

  Map<String, dynamic> toJson(BusinessCategoryModel json) {
    return {
      'key': json.key,
      'value': json.value,
    };
  }

  @override
  List<Object?> get props => [key, value];
}
