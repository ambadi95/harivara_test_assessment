import 'package:task_manager/base_classes/base_data_provider.dart';
import 'package:task_manager/task.dart';
import 'package:task_manager/task_manager_impl.dart';
import 'package:shared_data_models/loan_detail/create_loan_response/create_loan_response.dart';
import 'package:shared_data_models/loan_detail/loan_approval_response/loan_approval_response.dart';
import 'package:shared_data_models/commonresponse/common_response.dart';
import '../offlinepayment_module.dart';
import '../service/offlinepayment_service.dart';
import 'offlinepayment_viewmodel.dart';

class OfflinePaymentUseCase extends BaseDataProvider {
  final OfflinePaymentViewModel _offlinePaymentViewModel;
  final TaskManager taskManager;
  OfflinePaymentUseCase(this._offlinePaymentViewModel, this.taskManager)
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



  Future<CreateLoanResponse?> createLoan(
      String deviceId, Function(String) onErrorCallback) async {
    print(deviceId);
    String agentId = await getAgentId();
    print(agentId);
    String customerId = await getCustomerId();
    print(customerId);

    // String clientId= 'Y9C100'+ customerId;
    String clientId= await getClientId();




    return await executeApiRequest<CreateLoanResponse?>(
        taskType: TaskType.DATA_OPERATION,
        taskSubType: TaskSubType.REST,
        moduleIdentifier: OfflinePaymentModule.moduleIdentifier,
        requestData: {"agentId": agentId, "customerId": customerId, "deviceId": int.parse(deviceId),"clientId":clientId},
        serviceIdentifier: OfflinePaymentService.createLoanIdentifier,
        onError: onErrorCallback,
        modelBuilderCallback: (responseData) {
          CreateLoanResponse checkResponse;
          try {
            checkResponse = CreateLoanResponse.fromMap(responseData);
          } catch (e) {

            checkResponse =  CreateLoanResponse(
                status: false, code: "400", message: e.toString());
          }
          return checkResponse;
        });
  }


 // Future<CommonResponse?> makePayment(String amount ,
 //       Function(String) onErrorCallback) async {
 //    String mobileNumber = await getMobileNumber();
 //    String customerId = await getCustomerId();
 //
 //
 //    print(mobileNumber);
 //    print(customerId);
 //    return await executeApiRequest<CommonResponse?>(
 //        taskType: TaskType.DATA_OPERATION,
 //        taskSubType: TaskSubType.REST,
 //        moduleIdentifier: OfflinePaymentModule.moduleIdentifier,
 //        requestData: /*{
 //          "amountPaid": "2000",
 //          "customerId": "86",
 //          "mobileNumber": "686531710",
 //          "paymentType": "Downpayment"
 //        }*/
 //        {
 //          "amountPaid": amount,
 //          "customerId": customerId,
 //          "mobileNumber": mobileNumber,
 //          "paymentType": "Downpayment"
 //        },
 //        serviceIdentifier: OfflinePaymentService.makePaymentIdentifier,
 //        onError: onErrorCallback,
 //        modelBuilderCallback: (responseData) {
 //          CommonResponse checkResponse;
 //          try {
 //            checkResponse = CommonResponse.fromMap(responseData);
 //          } catch (e) {
 //            checkResponse =  CommonResponse(
 //                status: false, code: "400", message: e.toString()/*"Something went wrong"*/);
 //          }
 //          return checkResponse;
 //        });
 //  }
 //

  Future<LoanApprovalResponse?> loanApproval(
      String deviceId,String loanId, Function(String) onErrorCallback) async {
    return await executeApiRequest<LoanApprovalResponse?>(
        taskType: TaskType.DATA_OPERATION,
        taskSubType: TaskSubType.REST,
        moduleIdentifier: OfflinePaymentModule.moduleIdentifier,
        requestData: {"deviceId": int.parse(deviceId), "loanId": loanId},
        serviceIdentifier: OfflinePaymentService.activateLoanIdentifier,
        onError: onErrorCallback,
        modelBuilderCallback: (responseData) {
          LoanApprovalResponse checkResponse;
          try {
            checkResponse = LoanApprovalResponse.fromMap(responseData);
          } catch (e) {
            checkResponse =  LoanApprovalResponse(
                status: false, code: "400", message: e.toString()/*"Something went wrong"*/);
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
