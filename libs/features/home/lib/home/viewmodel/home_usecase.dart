import 'package:config/Config.dart';
import 'package:home/home/home_module.dart';
import 'package:home/home/service/home_service.dart';
import 'package:network_manager/auth/auth_manager.dart';
import 'package:shared_data_models/home/customerCount/customer_count_response/customer_count_response.dart';
import 'package:shared_data_models/loan_detail/response/loan_detail_response/loan_detail_response.dart';
import 'package:task_manager/base_classes/base_data_provider.dart';
import 'package:task_manager/task.dart';
import 'package:task_manager/task_manager_impl.dart';
import 'home_view_model.dart';

class HomeUserCase extends BaseDataProvider {
  final HomeViewModel customHomeViewModel;
  final IAuthManager _authManager;
  HomeUserCase(
      this.customHomeViewModel, this._authManager, TaskManager taskManager)
      : super(taskManager);

  Future<String> getAgentId() async {
    return await getValueFromSecureStorage('agentId', defaultValue: '');
  }

  Future<String> getCustomerId() async {
    return await getValueFromSecureStorage('customerId', defaultValue: '');
  }

  Future<String> getAgentName() async {
    return await getValueFromSecureStorage('agentName', defaultValue: '');
  }


  Future<String> getCustomerName() async {
    return await getValueFromSecureStorage('CustomerName', defaultValue: '');
  }

  Future<CustomerCountResponse?> getCustomerCount(
      Function(String) onErrorCallback) async {
    String id = await getAgentId();
    String? token = await _authManager.getAccessToken();
    return await executeApiRequest<CustomerCountResponse?>(
        taskType: TaskType.DATA_OPERATION,
        taskSubType: TaskSubType.REST,
        moduleIdentifier: HomeModule.moduleIdentifier,
        requestData: {'token': token, 'agentId': id},
        serviceIdentifier: IHomeService.customerCountIdentifier,
        onError: onErrorCallback,
        modelBuilderCallback: (responseData) {
          final data = responseData;
          CustomerCountResponse deviceListResponse =
              CustomerCountResponse.fromMap(data);
          return CustomerCountResponse.fromMap(data);
        });
  }

  Future<LoanDetailResponse?> getLoanDetails(
      Function(String) onErrorCallback) async {
    String id = await getCustomerId();
    String? token = await _authManager.getAccessToken();
    return await executeApiRequest<LoanDetailResponse?>(
        taskType: TaskType.DATA_OPERATION,
        taskSubType: TaskSubType.REST,
        moduleIdentifier: HomeModule.moduleIdentifier,
        requestData: {'token': token, 'customerId': id},
        serviceIdentifier: IHomeService.customerLoanDetails,
        onError: onErrorCallback,
        modelBuilderCallback: (responseData) {
          final data = responseData;
          LoanDetailResponse loanDetailResponse =
          LoanDetailResponse.fromJson(data);
          return loanDetailResponse;
        });
  }
}
