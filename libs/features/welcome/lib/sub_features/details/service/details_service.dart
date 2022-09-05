import 'dart:convert';

import 'package:config/Config.dart';
import 'package:core/logging/logger.dart';
import 'package:network_manager/model/requests/request.dart';
import 'package:network_manager/model/requests/standard/standard_request.dart';

abstract class IDetailsService {
  static const detailIdentifier = 'details';
  static const regionIdentifier = 'getRegion';
  static const districtIdentifier = 'getDistrict';
  static const submitCustomerDetailIdentifier = 'submitCustomerDetail';
  static const getCustomerDetailIdentifier = 'getCustomerDetail';

  Future<StandardRequest> getCustomerDetail(String mobileNumber);

  Future<StandardRequest> getRegion(UserType type);

  Future<StandardRequest> getDistrict(String regionId, UserType type);

  Future<StandardRequest> submitCustomerDetails(
      Map<String, dynamic> requestData, UserType type);
}

class DetailsService implements IDetailsService {
  @override
  Future<StandardRequest> getRegion(UserType userType) async {
    var request = StandardRequest();
    request.requestType = RequestType.GET;
    request.endpoint = (userType == UserType.AgentCustomer)
        ? customerEndpoint + 'region-details[customer]'
        : 'region-details';
    return request;
  }

  @override
  Future<StandardRequest> getCustomerDetail(String mobileNumber) async {
    var request = StandardRequest();
    request.requestType = RequestType.GET;
    request.endpoint = customerEndpoint + 'customer-details-by-mobile/$mobileNumber[customer]';
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
    return request;
  }

  @override
  Future<StandardRequest> submitCustomerDetails(
      Map<String, dynamic> requestData, UserType userType) async {
    print("calling on board customer");
    var request = StandardRequest();
    request.requestType = RequestType.POST;
    request.endpoint = (userType == UserType.AgentCustomer)
        ? customerEndpoint + 'customer-details[customer]'
        : 'customer-details';
    CrayonPaymentLogger.logInfo(requestData.toString());
    request.jsonBody = json.encode(requestData);
    return request;
  }
}
