import 'dart:convert';

import 'package:config/Config.dart';
import 'package:core/logging/logger.dart';
import 'package:network_manager/model/requests/request.dart';
import 'package:network_manager/model/requests/standard/standard_request.dart';

abstract class ICustomerDetailsService {
  static const detailIdentifier = 'details';
  static const regionIdentifier = 'getRegion';
  static const districtIdentifier = 'getDistrict';
  static const updateCustomerDetails = 'saveCustomerDetails';
  static const customerDetailIdentifier = 'getCustomerProfileData';
  static const getOrganizationTypeIdentifier = 'getOrganizationType';


  Future<StandardRequest> getRegion(UserType type);

  Future<StandardRequest> getDistrict(String regionId, UserType type);

  Future<StandardRequest> saveCustomerDetails(
      Map<String, dynamic> requestData, UserType type);

  Future<StandardRequest> getCustomerDetails(int customerId);

  Future<StandardRequest> getOrganizationType(UserType type);

}

class CustomerDetailsService implements ICustomerDetailsService {
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
  Future<StandardRequest> saveCustomerDetails(
      Map<String, dynamic> requestData, UserType userType) async {

    var request = StandardRequest();
    request.requestType = RequestType.PUT;
    request.endpoint = 'customer-details';
    request.customHeaders = {
      'Content-Type': 'application/json',
    };

    CrayonPaymentLogger.logInfo(requestData.toString());
    request.jsonBody = json.encode(requestData);
    return request;
  }

  @override
  Future<StandardRequest> getCustomerDetails(int customerId) async {
    var request = StandardRequest();
    request.requestType = RequestType.GET;
    request.endpoint = 'customer-details/$customerId';

    return request;
  }

  @override
  Future<StandardRequest> getOrganizationType(UserType userType) async {
    var request = StandardRequest();
    request.requestType = RequestType.GET;
    request.endpoint = (userType == UserType.AgentCustomer)
        ? customerEndpoint + 'organizationtype-details[customer]'
        : 'organizationtype-details';
    return request;
  }
}
