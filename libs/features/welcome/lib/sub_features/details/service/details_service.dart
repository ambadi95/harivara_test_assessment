

import 'dart:convert';

import 'package:network_manager/model/requests/request.dart';
import 'package:network_manager/model/requests/standard/standard_request.dart';

abstract class IDetailsService{
  static const detailIdentifier = 'details';
  static const regionIdentifier = 'getRegion';
  static const districtIdentifier = 'getDistrict';
  static const submitCustomerDetailIdentifier = 'submitCustomerDetail';

  Future<StandardRequest> getRegion(
      );

  Future<StandardRequest> getDistrict(
      String regionId
      );

  Future<StandardRequest> submitCustomerDetails(
      Map<String, dynamic> requestData,
      );
}

class DetailsService implements IDetailsService {
  @override
  Future<StandardRequest> getRegion(
      ) async {
    var request = StandardRequest();
    request.requestType = RequestType.GET;
    request.endpoint = 'region-details';
    request.customHeaders = {
      'Content-Type': 'application/json',
    };
    return request;
  }
  @override
  Future<StandardRequest> getDistrict(
      String regionId
      ) async {
    var request = StandardRequest();
    request.requestType = RequestType.GET;
    request.endpoint = 'district-details/$regionId';
    request.customHeaders = {
      'Content-Type': 'application/json',
    };
    return request;
  }

  @override
  Future<StandardRequest> submitCustomerDetails(
      Map<String, dynamic> requestData,
      ) async {
    var request = StandardRequest();
    request.requestType = RequestType.POST;
    request.endpoint = 'customer-details';
    request.customHeaders = {
      'Content-Type': 'application/json',
    };
    request.jsonBody = json.encode(requestData);
    return request;
  }
}