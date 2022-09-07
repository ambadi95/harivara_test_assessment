import 'package:core/logging/logger.dart';
import 'package:network_manager/auth/auth_manager.dart';
import 'package:payments/payments_module.dart';
import 'package:payments/service/payment_service.dart';
import 'package:payments/viewmodel/payments_viewmodel.dart';
import 'package:shared_data_models/agent_onboard/agent_details/response/agent_details_response.dart';
import 'package:shared_data_models/customer_onboard/customer_details/response/customer_detail_response.dart';
import 'package:shared_data_models/welcome/signin/response/customer_sign_in_response.dart';
import 'package:task_manager/base_classes/base_data_provider.dart';
import 'package:task_manager/task.dart';
import 'package:task_manager/task_manager_impl.dart';

class PaymentsUseCase extends BaseDataProvider {
  final PaymentsViewModel _paymentsviewmodel;

  PaymentsUseCase(this._paymentsviewmodel, TaskManager taskManager)
      : super(taskManager);

  Future<String> getAgentName() async {
    return await getValueFromSecureStorage('agentName', defaultValue: '');
  }

  Future<String> getMobileNumber() async {
    return await getValueFromSecureStorage('mobileNumber', defaultValue: '');
  }

  Future<String> getCustomerId() async {
    return await getValueFromSecureStorage('customerId', defaultValue: '');
  }


  Future<CustomerDetailResponse?> hitPaymentApi(
    String amount,
    String paymentType,
    Function(String) onErrorCallback,
  ) async {
    String mobileNO = await getMobileNumber();
    print(mobileNO);
    mobileNO = mobileNO.substring(4, mobileNO.length);
    int customerId = int.parse(await getCustomerId());

    Map<String, String> params = {
      "amountPaid": amount,
      "customerId": customerId.toString(),
      "mobileNumber": mobileNO,
      "paymentType": paymentType
    };

    print("//////");
    print(params);

    return await executeApiRequest<CustomerDetailResponse?>(
        taskType: TaskType.DATA_OPERATION,
        taskSubType: TaskSubType.REST,
        moduleIdentifier: PaymentsModule.moduleIdentifier,
        requestData: params,
        serviceIdentifier: IPaymentService.paymentIdentifier,
        onError: onErrorCallback,
        modelBuilderCallback: (responseData) {
          final data = responseData;
          print("//////");
          print("RESPONSE");
          print(data.toString());

          return CustomerDetailResponse.fromJson(data);
        });
  }
}
