import 'dart:convert';

import 'package:network_manager/model/requests/request.dart';
import 'package:network_manager/model/requests/standard/standard_request.dart';

abstract class IReferralProgramService {
  static const referralListIdentifier = 'referralProgram';
  static const inviteFriendIdentifier = 'referral-user';

  Future<StandardRequest> getReferralProgram(String customerId, String filter);
  Future<StandardRequest> callInviteFriend(Map<String, dynamic> requestData);
}

class ReferralProgramService implements IReferralProgramService {
  @override
  Future<StandardRequest> getReferralProgram(
      String customerId,
      String filter
  ) async {
    var request = StandardRequest();
    request.requestType = RequestType.GET;
    request.endpoint = 'list-referral/${customerId}?status=${filter}';
    return request;
   }

   @override
  Future<StandardRequest> callInviteFriend(
       Map<String, dynamic> requestData  ) async {
    var request = StandardRequest();
    request.requestType = RequestType.POST;
    request.endpoint = 'referral-user';
    request.jsonBody = json.encode(requestData);
    return request;
   }
}
