import 'package:equatable/equatable.dart';

import 'business_category_model.dart';

class UpdateProfileRequest extends Equatable {
  const UpdateProfileRequest(
    this.address,
    this.businessCategoryModel,
    this.merchantId,
    this.name,
  );

  final String address;
  final String merchantId;
  final String name;
  final BusinessCategoryModel businessCategoryModel;

  factory UpdateProfileRequest.fromJson(Map<String, dynamic> json) =>
      UpdateProfileRequest(
        json['address'],
        json['merchantId'],
        json['name'],
        json['businessCategoryModel'],
      );

  Map<String, dynamic> toJson(UpdateProfileRequest json) {
    return {
      'address': json.address,
      'merchantId': json.merchantId,
      'name': json.name,
      'businessCategoryModel': json.businessCategoryModel,
    };
  }

  @override
  List<Object?> get props => [address, merchantId, name, businessCategoryModel];
}
