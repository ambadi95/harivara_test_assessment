import 'package:task_manager/task_manager.dart';

import '../service/otherpayment_service.dart';

class OtherPaymentApiResolver extends TaskResolver {
  final OtherPaymentService _otherPaymentService;

  OtherPaymentApiResolver(this._otherPaymentService);

  @override
  Future execute(String identifier, Map<String, dynamic> requestData) {
    switch (identifier) {
     case OtherPaymentService.createLoanIdentifier:
        return _otherPaymentService.createLoan(requestData);
      case OtherPaymentService.activateLoanIdentifier:
        return _otherPaymentService.activateLoan(requestData);
      default:
        throw UnimplementedError();
    }
  }
}
