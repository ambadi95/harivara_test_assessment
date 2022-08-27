import 'dart:convert';

import 'package:config/Config.dart';
import 'package:core/logging/logger.dart';
import 'package:network_manager/model/requests/request.dart';
import 'package:network_manager/model/requests/standard/standard_request.dart';

abstract class ICustomerDetailsService {
  static const detailIdentifier = 'details';
  static const regionIdentifier = 'getRegion';
  static const districtIdentifier = 'getDistrict';
  static const submitCustomerDetailIdentifier = 'submitCustomerDetail';
  static const customerDetailIdentifier = 'getCustomerProfileData';

  Future<StandardRequest> getRegion(UserType type);

  Future<StandardRequest> getDistrict(String regionId, UserType type);

  Future<StandardRequest> submitCustomerDetails(
      Map<String, dynamic> requestData, UserType type);

  Future<StandardRequest> getCustomerDetails(int customerId);
}

class CustomerDetailsService implements ICustomerDetailsService {
  @override
  Future<StandardRequest> getRegion(UserType userType) async {
    var request = StandardRequest();
    request.requestType = RequestType.GET;
    request.endpoint = (userType == UserType.AgentCustomer)
        ? customerEndpoint + 'region-details[customer]'
        : 'region-details';
        request.customHeaders = await request.headers();
    return request;
  }

  @override
  Future<StandardRequest> getDistrict(
      String regionId, UserType userType) async {
    var request = StandardRequest();
    request.requestType = RequestType.GET;
    request.endpoint = (userType == UserType.AgentCustomer)
        ? customerEndpoint + 'district-details/$regionId[customer]'
        : 'district-details/$regionId';
        request.customHeaders = await request.headers();
    return request;
  }

  @override
  Future<StandardRequest> submitCustomerDetails(
      Map<String, dynamic> requestData, UserType userType) async {
    var request = StandardRequest();
    request.requestType = RequestType.POST;
    request.endpoint = (userType == UserType.AgentCustomer)
        ? customerEndpoint + 'customer-details[customer]'
        : 'customer-details';
        request.customHeaders = await request.headers();
    CrayonPaymentLogger.logInfo(requestData.toString());
    request.jsonBody = json.encode(requestData);
    return request;
  }

  @override
  Future<StandardRequest> getCustomerDetails(int customerId) async {
    var request = StandardRequest();
    request.requestType = RequestType.GET;
    request.endpoint = 'customer-details/$customerId';
        request.customHeaders = await request.headers();

    return request;
  }
}
