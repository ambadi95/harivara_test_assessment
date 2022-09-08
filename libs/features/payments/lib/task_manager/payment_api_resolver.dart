import 'package:payments/service/payment_service.dart';
import 'package:task_manager/task_manager.dart';

import '../sub_features/payment_status/service/payment_status_service.dart';

class PaymentApiResolver extends TaskResolver {
  final IPaymentService _paymentService;
  final IPaymentStatusService _paymentStatusService;

  PaymentApiResolver(this._paymentService,this._paymentStatusService);

  @override
  Future execute(String identifier, Map<String, dynamic> requestData) {
    switch (identifier) {
      case IPaymentService.paymentIdentifier:
        return _paymentService.payApi(requestData);
      case IPaymentStatusService.paymentStatusIdentifier:
        return _paymentStatusService.checkPaymentStatus(requestData);
      default:
        print("//////UnImplemented");
        throw UnimplementedError();
    }
  }
}
