import 'package:task_manager/base_classes/base_data_provider.dart';
import 'package:task_manager/task.dart';
import 'package:task_manager/task_manager_impl.dart';
import 'package:shared_data_models/loan_detail/create_loan_response/create_loan_response.dart';
import 'package:shared_data_models/loan_detail/loan_approval_response/loan_approval_response.dart';
import 'package:shared_data_models/commonresponse/common_response.dart';
import '../downpayment_module.dart';
import '../service/downpayment_service.dart';
import 'downpayment_viewmodel.dart';

class DownPaymentUseCase extends BaseDataProvider {
  final DownPaymentViewModel _downpaymentviewmodel;
  final TaskManager taskManager;
  DownPaymentUseCase(this._downpaymentviewmodel, this.taskManager)
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



  Future<CreateLoanResponse?> createLoan(
      String deviceId, Function(String) onErrorCallback) async {
    String agentId = await getAgentId();
    print(agentId);
    String customerId = await getCustomerId();
    print(customerId);

    String clientId= await getClientId();
    print(clientId);


    return await executeApiRequest<CreateLoanResponse?>(
        taskType: TaskType.DATA_OPERATION,
        taskSubType: TaskSubType.REST,
        moduleIdentifier: DownPaymentModule.moduleIdentifier,
        requestData: {"agentId": agentId, "customerId": customerId, "deviceId": int.parse(deviceId),"clientId":clientId},
        serviceIdentifier: DownPaymentService.createLoanIdentifier,
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


 Future<CommonResponse?> makePayment(String amount ,
       Function(String) onErrorCallback) async {
    String mobileNumber = await getMobileNumber();
    String customerId = await getCustomerId();
    return await executeApiRequest<CommonResponse?>(
        taskType: TaskType.DATA_OPERATION,
        taskSubType: TaskSubType.REST,
        moduleIdentifier: DownPaymentModule.moduleIdentifier,
        requestData: /*{
          "amountPaid": "2000",
          "customerId": "86",
          "mobileNumber": "686531710",
          "paymentType": "Downpayment"
        }*/
        {
          "amountPaid": amount,
          "customerId": customerId,
          "mobileNumber": mobileNumber,
          "paymentType": "Downpayment"
        },
        serviceIdentifier: DownPaymentService.makePaymentIdentifier,
        onError: onErrorCallback,
        modelBuilderCallback: (responseData) {
          CommonResponse checkResponse;
          try {
            checkResponse = CommonResponse.fromMap(responseData);
          } catch (e) {
            checkResponse =  CommonResponse(
                status: false, code: "400", message: e.toString()/*"Something went wrong"*/);
          }
          return checkResponse;
        });
  }

 Future<CommonResponse?> checkPaymentStatus(
      String paymentId, Function(String) onErrorCallback) async {
    String mobileNumber = await getMobileNumber();
    String customerId = await getCustomerId();
    return await executeApiRequest<CommonResponse?>(
        taskType: TaskType.DATA_OPERATION,
        taskSubType: TaskSubType.REST,
        moduleIdentifier: DownPaymentModule.moduleIdentifier,
        requestData: {
          "paymentId":paymentId
        },
        serviceIdentifier: DownPaymentService.paymentStatusIdentifier,
        onError: onErrorCallback,
        modelBuilderCallback: (responseData) {
          CommonResponse checkResponse;
          try {
            checkResponse = CommonResponse.fromMap(responseData);
          } catch (e) {
            checkResponse =  CommonResponse(
                status: false, code: "400", message: e.toString()/*"Something went wrong"*/);
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

  Future<void> setPaymentId(String paymentId) async {
      return await setValueToSecureStorage({'paymentId': paymentId});

  }
  Future<void> setDeviceId(String deviceId) async {
      return await setValueToSecureStorage({'deviceId': deviceId});

  }
}
