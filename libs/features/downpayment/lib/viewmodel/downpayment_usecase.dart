import 'package:task_manager/base_classes/base_data_provider.dart';
import 'package:task_manager/task.dart';
import 'package:task_manager/task_manager_impl.dart';
import 'package:shared_data_models/loan_detail/create_loan_response/create_loan_response.dart';
import 'package:shared_data_models/loan_detail/loan_approval_response/loan_approval_response.dart';
import '../downpayment_module.dart';
import '../service/downpayment_service.dart';
import 'downpayment_viewmodel.dart';

class DownPaymentUseCase extends BaseDataProvider {
  final DownPaymentViewModel _downpaymentviewmodel;

  DownPaymentUseCase(this._downpaymentviewmodel, TaskManager taskManager)
      : super(taskManager);

  Future<String> getAgentName() async {
    return await getValueFromSecureStorage('agentName', defaultValue: '');
  }

  Future<String> getAgentId() async {
    return await getValueFromSecureStorage('agentId', defaultValue: '');
  }

  Future<String> getCustomerId() async {
    return await getValueFromSecureStorage('customerId', defaultValue: '');
  }

  Future<CreateLoanResponse?> createLoan(
      int deviceId, Function(String) onErrorCallback) async {
    String agentId = await getAgentId();
    print(agentId);
    String customerId = await getCustomerId();
    print(customerId);
    return await executeApiRequest<CreateLoanResponse?>(
        taskType: TaskType.DATA_OPERATION,
        taskSubType: TaskSubType.REST,
        moduleIdentifier: DownPaymentModule.moduleIdentifier,
        requestData: {"agentId": '356HYT6581', "customerId": 86, "deviceId": 1},
        serviceIdentifier: DownPaymentService.createLoanIdentifier,
        onError: onErrorCallback,
        modelBuilderCallback: (responseData) {
          CreateLoanResponse checkResponse;
          try {
            checkResponse = CreateLoanResponse.fromMap(responseData);
          } catch (e) {
            checkResponse = const CreateLoanResponse(
                status: false, code: "400", message: "Something went wrong");
          }
          return checkResponse;
        });
  }

  Future<LoanApprovalResponse?> activateLoan(
      String customerId, Function(String) onErrorCallback) async {
    return await executeApiRequest<LoanApprovalResponse?>(
        taskType: TaskType.DATA_OPERATION,
        taskSubType: TaskSubType.REST,
        moduleIdentifier: DownPaymentModule.moduleIdentifier,
        requestData: {"deviceId": 1, "loanId": "string"},
        serviceIdentifier: DownPaymentService.activateLoanIdentifier,
        onError: onErrorCallback,
        modelBuilderCallback: (responseData) {
          LoanApprovalResponse checkResponse;
          try {
            checkResponse = LoanApprovalResponse.fromMap(responseData);
          } catch (e) {
            checkResponse = const LoanApprovalResponse(
                status: false, code: "400", message: "Something went wrong");
          }
          return checkResponse;
        });
  }
}
