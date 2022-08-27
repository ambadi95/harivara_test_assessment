import 'package:payments/service/payment_service.dart';
import 'package:task_manager/task_manager.dart';

class PaymentApiResolver extends TaskResolver {
  final IPaymentService _paymentService;

  PaymentApiResolver(this._paymentService);

  @override
  Future execute(String identifier, Map<String, dynamic> requestData) {
    switch (identifier) {
      case IPaymentService.paymentIdentifier:
        return _paymentService.payApi(requestData);
      default:
        print("//////UnImplemented");
        throw UnimplementedError();
    }
  }
}
