import 'package:task_manager/task_manager.dart';

import '../service/referral_program_service.dart';

class ReferralProgramApiResolver extends TaskResolver {
  final IReferralProgramService _referralProgramService;

  ReferralProgramApiResolver(this._referralProgramService);

  @override
  Future execute(String identifier, Map<String, dynamic> requestData) {
    switch (identifier) {
      case IReferralProgramService.referralListIdentifier:
        return _referralProgramService
            .getReferralProgram(requestData['customerId'],requestData['filter']);

        case IReferralProgramService.inviteFriendIdentifier:
        return _referralProgramService
            .callInviteFriend(requestData);
      default:
        throw UnimplementedError();
    }
  }
}
