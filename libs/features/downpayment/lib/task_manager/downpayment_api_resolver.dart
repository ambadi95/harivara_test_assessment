import 'package:task_manager/task_manager.dart';

import '../service/downpayment_service.dart';

class DownPaymentApiResolver extends TaskResolver {
  final DownPaymentService _downPaymentService;

  DownPaymentApiResolver(this._downPaymentService);

  @override
  Future execute(String identifier, Map<String, dynamic> requestData) {
    switch (identifier) {
      case DownPaymentService.createLoanIdentifier:
        return _downPaymentService.createLoan(requestData);
      case DownPaymentService.activateLoanIdentifier:
        return _downPaymentService.activateLoan(requestData);
      default:
        throw UnimplementedError();
    }
  }
}
