import 'dart:convert';

import 'package:network_manager/model/requests/request.dart';
import 'package:network_manager/model/requests/standard/standard_request.dart';

abstract class IEnrollmentService {
  static const enrollmentIdentifier = 'enrollment';

  Future<StandardRequest> getCustomerDetails(
    String customerId,
  );
}

class EnrollmentService implements IEnrollmentService {
  @override
  Future<StandardRequest> getCustomerDetails(
    String customerId,
  ) async {
    var request = StandardRequest();
    request.requestType = RequestType.GET;
    request.endpoint = 'customer-details/${customerId}';
    request.customHeaders = {
      'Content-Type': 'application/json',
    };
    return request;
  }
}
