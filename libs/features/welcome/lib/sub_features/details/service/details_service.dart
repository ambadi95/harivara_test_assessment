import 'dart:convert';

import 'package:config/Config.dart';
import 'package:network_manager/model/requests/request.dart';
import 'package:network_manager/model/requests/standard/standard_request.dart';

abstract class IDetailsService {
  static const detailIdentifier = 'details';
  static const regionIdentifier = 'getRegion';
  static const districtIdentifier = 'getDistrict';
  static const submitCustomerDetailIdentifier = 'submitCustomerDetail';

  Future<StandardRequest> getRegion(UserType type);

  Future<StandardRequest> getDistrict(String regionId,UserType type);

  Future<StandardRequest> submitCustomerDetails(
    Map<String, dynamic> requestData, UserType type
  );
}

class DetailsService implements IDetailsService {
  @override
  Future<StandardRequest> getRegion(UserType userType) async {
    var request = StandardRequest();
    request.requestType = RequestType.GET;
    request.endpoint = userType == UserType.AgentCustomer ? 'https://y9-dev-capi.testmaya.com/customers/v1/region-details[customer]' :'region-details' ;
    request.customHeaders = {
      'Content-Type': 'application/json',
    };
    return request;
  }

  @override
  Future<StandardRequest> getDistrict(String regionId,UserType userType ) async {
    var request = StandardRequest();
    request.requestType = RequestType.GET;
    request.endpoint = userType == UserType.AgentCustomer ? 'https://y9-dev-capi.testmaya.com/customers/v1/district-details/$regionId[customer]' :'district-details/$regionId';
    request.customHeaders = {
      'Content-Type': 'application/json',
    };
    return request;
  }

  @override
  Future<StandardRequest> submitCustomerDetails(
    Map<String, dynamic> requestData,UserType userType
  ) async {
    var request = StandardRequest();
    request.requestType = RequestType.POST;
    request.endpoint = userType == UserType.AgentCustomer ?
    'https://y9-dev-capi.testmaya.com/customers/v1/customer-details[customer]' : 'customer-details';
    request.customHeaders = {
      'Content-Type': 'application/json',
    };
    request.jsonBody = json.encode(requestData);
    return request;
  }
}
