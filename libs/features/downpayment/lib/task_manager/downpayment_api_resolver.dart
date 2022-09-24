import 'package:task_manager/task_manager.dart';

import '../service/downpayment_service.dart';

class DownPaymentApiResolver extends TaskResolver {
  final DownPaymentService _downPaymentService;

  DownPaymentApiResolver(this._downPaymentService);

  @override
  Future execute(String identifier, Map<String, dynamic> requestData) {
    switch (identifier) {
      case DownPaymentService.makePaymentIdentifier:
        return _downPaymentService.makePayment(requestData);
      case DownPaymentService.makePaymentMpesaIdentifier:
        return _downPaymentService.makePaymentMpesa(requestData);
      case DownPaymentService.paymentStatusIdentifier:
        return _downPaymentService.checkPaymentStatus(requestData);
      case DownPaymentService.paymentStatusMpesaIdentifier:
        return _downPaymentService.checkPaymentStatusMpesa(requestData);
      case DownPaymentService.createLoanIdentifier:
        return _downPaymentService.createLoan(requestData);
      case DownPaymentService.activateLoanIdentifier:
        return _downPaymentService.activateLoan(requestData);
      default:
        throw UnimplementedError();
    }
  }
}
