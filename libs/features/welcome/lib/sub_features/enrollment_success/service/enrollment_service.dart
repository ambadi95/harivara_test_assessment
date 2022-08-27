import 'dart:convert';
import 'dart:developer';

import 'package:config/Config.dart';
import 'package:network_manager/model/requests/request.dart';
import 'package:network_manager/model/requests/standard/standard_request.dart';

abstract class IEnrollmentService {
  static const enrollmentIdentifier = 'enrollment';

  Future<StandardRequest> getCustomerDetails(
      String customerId, String token, UserType userType);
}

class EnrollmentService implements IEnrollmentService {
  @override
  Future<StandardRequest> getCustomerDetails(
      String customerId, String token, UserType userType) async {
    var request = StandardRequest();
    request.requestType = RequestType.GET;
    request.endpoint = userType == UserType.AgentCustomer
        ? customerEndpoint + 'customer-details/${customerId}[customer]'
        : 'customer-details/${customerId}';
    request.customHeaders = await  request.headers();

    return request;
  }
}
