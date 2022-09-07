import 'package:shared_data_models/commonresponse/common_response.dart';
import 'package:shared_data_models/payments/payment_status_response/payment_status_check_response.dart';
import 'package:task_manager/base_classes/base_data_provider.dart';
import 'package:task_manager/task_manager.dart';

import '../../../payments_module.dart';
import '../service/payment_status_service.dart';
import 'payment_status_view_model.dart';

class PaymentStatusUseCase extends BaseDataProvider {
  PaymentStatusViewModel _paymentStatusViewModel;

  PaymentStatusUseCase(this._paymentStatusViewModel, TaskManager taskManager)
      : super(taskManager);

  Future<String> getCustomerId() async {
    return await getValueFromSecureStorage('customerId', defaultValue: '');
  }

  Future<String> getMobileNumber() async {
    return await getValueFromSecureStorage('mobileNumber', defaultValue: '');
  }

  Future<PaymentStatusCheckResponse?> checkPaymentStatus(
      String paymentId, Function(String) onErrorCallback) async {
    return await executeApiRequest<PaymentStatusCheckResponse?>(
        taskType: TaskType.DATA_OPERATION,
        taskSubType: TaskSubType.REST,
        moduleIdentifier: PaymentsModule.moduleIdentifier,
        requestData: {"paymentId": paymentId},
        serviceIdentifier: IPaymentStatusService.paymentStatusIdentifier,
        onError: onErrorCallback,
        modelBuilderCallback: (responseData) {
          PaymentStatusCheckResponse checkResponse;
          try {
            checkResponse = PaymentStatusCheckResponse.fromJson(responseData);
          } catch (e) {
            checkResponse = PaymentStatusCheckResponse(
                status: false,
                code: "400",
                message: e.toString() /*"Something went wrong"*/);
          }
          return checkResponse;
        });
  }
}
