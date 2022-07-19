import 'package:shared_data_models/signup/create_response.dart';

class CreateMerchantResponse extends CreateResponse {
  final String? serviceFlow;
  final dynamic errors;

  CreateMerchantResponse({
    String? serviceRequestId,
    String? message,
    String? status,
    String? userId,
    this.serviceFlow,
    this.errors,
  }) : super(
          status: status,
          message: message,
          serviceRequestId: serviceRequestId,
          userId: userId,
        );

  factory CreateMerchantResponse.fromJson(Map<String, dynamic> json) =>
      CreateMerchantResponse(
        message: json['message'] ?? '',
        serviceFlow: json['serviceFlow'] ?? '',
        serviceRequestId: json['serviceRequestId'] ?? '',
        status: json['status'] ?? '',
        userId: json['userId'] ?? '',
        errors: json['errors'] ?? '',
      );

  List<Object?> get props => [
        message,
        serviceFlow,
        serviceRequestId,
        status,
        userId,
    errors,
      ];
}
