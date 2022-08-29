import 'package:task_manager/task_manager.dart';

import '../service/kyc_credit_service.dart';

class KycCheckApiResolver extends TaskResolver {
  final KycCreditService _kycCreditService;

  KycCheckApiResolver(this._kycCreditService);

  @override
  Future execute(String identifier, Map<String, dynamic> requestData) {
    switch (identifier) {
      case KycCreditService.kycCheckIdentifier:
        return _kycCreditService.kycCheck(requestData);
      case KycCreditService.creditScoreIdentifier:
        return _kycCreditService.creditScore(requestData);
      case KycCreditService.creditCheckIdentifier:
        return _kycCreditService.creditCheck(requestData);

      default:
        throw UnimplementedError();
    }
  }
}
