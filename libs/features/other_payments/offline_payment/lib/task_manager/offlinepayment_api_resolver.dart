import 'package:task_manager/task_manager.dart';

import '../service/offlinepayment_service.dart';

class OfflinePaymentApiResolver extends TaskResolver {
  final OfflinePaymentService _offlinePaymentService;

  OfflinePaymentApiResolver(this._offlinePaymentService);

  @override
  Future execute(String identifier, Map<String, dynamic> requestData) {
    switch (identifier) {
     case OfflinePaymentService.createLoanIdentifier:
        return _offlinePaymentService.createLoan(requestData);
      case OfflinePaymentService.activateLoanIdentifier:
        return _offlinePaymentService.activateLoan(requestData);
      default:
        throw UnimplementedError();
    }
  }
}
