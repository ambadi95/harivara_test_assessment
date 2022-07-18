import 'package:shared_data_models/signup/create_response.dart';

class CreateCustomerResponse extends CreateResponse {
  dynamic errors;
  CreateCustomerResponse({
    String? serviceRequestId,
    String? message,
    String? status,
    String? userId,
    this.errors,
  }) : super(
          status: status,
          message: message,
          serviceRequestId: serviceRequestId,
          userId: userId,
        );


  factory CreateCustomerResponse.fromJson(Map<String, dynamic> json) =>
      CreateCustomerResponse(
        serviceRequestId: json['serviceRequestId'],
        message: json['message'],
        status: json['status'],
        userId: json['userId'],
        errors: json['errors'],
      );
}
