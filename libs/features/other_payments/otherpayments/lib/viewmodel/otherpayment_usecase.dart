import 'package:task_manager/base_classes/base_data_provider.dart';
import 'package:task_manager/task.dart';
import 'package:task_manager/task_manager_impl.dart';
import 'package:shared_data_models/loan_detail/create_loan_response/create_loan_response.dart';
import 'package:shared_data_models/loan_detail/loan_approval_response/loan_approval_response.dart';
import 'package:shared_data_models/commonresponse/common_response.dart';

import '../otherpayment_module.dart';
import '../service/otherpayment_service.dart';
import 'otherpayment_viewmodel.dart';

class OtherPaymentUseCase extends BaseDataProvider {
  final OtherPaymentViewModel _otherPaymentViewModel;
  final TaskManager taskManager;

  OtherPaymentUseCase(this._otherPaymentViewModel, this.taskManager)
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

  Future<String> getClientId() async {
    return await getValueFromSecureStorage('clientId', defaultValue: '');
  }

  Future<String> getPaymentFailed() async {
    return await getValueFromSecureStorage('paymentFailed', defaultValue: '');
  }

  Future<String> getMobileNumber() async {
    return await getValueFromSecureStorage('mobileNumber', defaultValue: '');
  }

  Future<String> getPaymentID() async {
    return await getValueFromSecureStorage('paymentId', defaultValue: '');
  }

  Future<String> getNewCustomerName() async {
    return await getValueFromSecureStorage('newCustomerName', defaultValue: '');
  }

  Future<String> getDeviceId() async {
    return await getValueFromSecureStorage('deviceId', defaultValue: '');
  }

  Future<String> getLoanCalled() async {
    return await getValueFromSecureStorage('loanCalled', defaultValue: '');
  }

  bool isValidTranID(String tranID) {
    return _otherPaymentViewModel.isValidTranID(tranID);
  }

  bool isValidMobileNumber(String mobileNumber) {
    return _otherPaymentViewModel.isValidMobileNumber(mobileNumber);
  }


  Future<CreateLoanResponse?> createLoan(
    String amountPaid,
    String mobileNumber,
    String transactionId,
    Function(String) onErrorCallback,
  ) async {
    String customerId = await getCustomerId();


    return await executeApiRequest<CreateLoanResponse?>(
        taskType: TaskType.DATA_OPERATION,
        taskSubType: TaskSubType.REST,
        moduleIdentifier: OtherPaymentModule.moduleIdentifier,
        requestData: {
          "amountPaid": amountPaid,
          "customerId": customerId,
          "mobileNo": mobileNumber,
          "transactionId": transactionId
        },
        serviceIdentifier: OtherPaymentService.createLoanIdentifier,
        onError: onErrorCallback,
        modelBuilderCallback: (responseData) {
          /*  CreateLoanResponse checkResponse;
          try {
            checkResponse = CreateLoanResponse.fromMap(responseData);
          } catch (e) {
            checkResponse = CreateLoanResponse(
                status: false, code: "400", message: e.toString());
          }
          return checkResponse;*/
        });
  }

  Future<CommonResponse?> makePayment(
      String amountPaid,
      String mobileNumber,
      String transactionId,
    Function(String) onErrorCallback,
  ) async {
    //String mobileNumber = await getMobileNumber();
    String customerId = await getCustomerId();

    print(mobileNumber);
    print(customerId);
    return await executeApiRequest<CommonResponse?>(
        taskType: TaskType.DATA_OPERATION,
        taskSubType: TaskSubType.REST,
        moduleIdentifier: OtherPaymentModule.moduleIdentifier,
        requestData: /*{
          "amountPaid": "2000",
          "customerId": "86",
          "mobileNumber": "686531710",
          "paymentType": "Downpayment"
        }*/
            {
          "amountPaid": amountPaid,
          "customerId": customerId,
          "mobileNo": "+255"+ mobileNumber.replaceAll(" ", ""),
          "transactionId": transactionId
        },
        serviceIdentifier: OtherPaymentService.makePaymentIdentifier,
        onError: onErrorCallback,
        modelBuilderCallback: (responseData) {
          CommonResponse checkResponse;
          try {
            checkResponse = CommonResponse.fromMap(responseData);
          } catch (e) {
            checkResponse = CommonResponse(
                status: false,
                code: "400",
                message: e.toString() /*"Something went wrong"*/);
          }
          return checkResponse;
        });
  }

  Future<LoanApprovalResponse?> loanApproval(
      String deviceId, String loanId, Function(String) onErrorCallback) async {
    return await executeApiRequest<LoanApprovalResponse?>(
        taskType: TaskType.DATA_OPERATION,
        taskSubType: TaskSubType.REST,
        moduleIdentifier: OtherPaymentModule.moduleIdentifier,
        requestData: {"deviceId": int.parse(deviceId), "loanId": loanId},
        serviceIdentifier: OtherPaymentService.activateLoanIdentifier,
        onError: onErrorCallback,
        modelBuilderCallback: (responseData) {
          LoanApprovalResponse checkResponse;
          try {
            checkResponse = LoanApprovalResponse.fromMap(responseData);
          } catch (e) {
            checkResponse = LoanApprovalResponse(
                status: false,
                code: "400",
                message: e.toString() /*"Something went wrong"*/);
          }
          return checkResponse;
        });
  }

  @override
  Future<void> setValueToSecureStorage(Map<String, dynamic> keyValueMap) async {
    await taskManager.execute(
      Task(
        requestData: {
          CACHE_TYPE: TaskManagerCacheType.SECURE_SET,
          DATA_KEY: keyValueMap,
        },
        taskType: TaskType.CACHE_OPERATION,
      ),
    );
    return;
  }
}
