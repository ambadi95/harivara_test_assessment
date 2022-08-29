import 'package:task_manager/task_manager.dart';

import '../service/kyc_main_service.dart';

class KycMainApiResolver extends TaskResolver {
  final KycMainService _kycmainService;

  KycMainApiResolver(this._kycmainService);

  @override
  Future execute(String identifier, Map<String, dynamic> requestData) {
    switch (identifier) {
      case KycMainService.consentIndentifier:
        return _kycmainService.callConsent(requestData);

      default:
        throw UnimplementedError();
    }
  }
}
