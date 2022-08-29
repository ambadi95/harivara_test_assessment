import 'package:task_manager/task_manager.dart';

import '../service/kyc_credit_service.dart';

class KycCheckApiResolver extends TaskResolver {
  final KycCreditService _kycCreditService;

  KycCheckApiResolver(this._kycCreditService);

  @override
  Future execute(String identifier, Map<String, dynamic> requestData) {
    switch (identifier) {
      case KycCreditService.kyccheckIndentifier:
        return _kycCreditService.kycCheck(requestData);

      default:
        throw UnimplementedError();
    }
  }
}
