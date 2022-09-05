import 'package:config/Config.dart';
import 'package:network_manager/auth/auth_manager.dart';
import 'package:shared_data_models/customer_details/response/get_customer_details_response/get_customer_details_response.dart';
import 'package:task_manager/base_classes/base_data_provider.dart';
import 'package:task_manager/task_manager.dart';
import 'package:task_manager/task_manager_impl.dart';
import 'package:welcome/sub_features/enrollment_success/service/enrollment_service.dart';
import '../../../welcome_module.dart';

class EnrollmentSuccessUseCase extends BaseDataProvider {
  final IAuthManager _authManager;
  final CacheTaskResolver _cacheTaskResolver;

  EnrollmentSuccessUseCase(
      this._authManager, this._cacheTaskResolver, TaskManager taskManager)
      : super(taskManager);

  Future<String> getCustomerId() async {
    return await getValueFromSecureStorage('customerId', defaultValue: '');
  }

  Future<void> saveCustomerUserId(String? customerId) async {
    return await setValueToSecureStorage({'CustomerY9Id': customerId});
  }



  Future<void> saveCustomerName(String? customerId) async {
    return await setValueToSecureStorage({'CustomerName': customerId});
  }

  Future logout() async {
    _cacheTaskResolver
        .execute("", {CACHE_TYPE: TaskManagerCacheType.DELETE_ALL});
  }

  Future<GetCustomerDetailsResponse?> getCustomerDetails(
      UserType userType, Function(String) onErrorCallback) async {
    String id = await getCustomerId();
    String? token = await _authManager.getAccessToken();
    return await executeApiRequest<GetCustomerDetailsResponse?>(
        taskType: TaskType.DATA_OPERATION,
        taskSubType: TaskSubType.REST,
        moduleIdentifier: WelcomeModule.moduleIdentifier,
        requestData: {"customerId": id, "token": token, 'userType': userType},
        serviceIdentifier: IEnrollmentService.enrollmentIdentifier,
        onError: onErrorCallback,
        modelBuilderCallback: (responseData) {
          final data = responseData;
          GetCustomerDetailsResponse customerDetailsResponse =
              GetCustomerDetailsResponse.fromJson(data);
          String? firstName = customerDetailsResponse.data?.firstName!;
          String? lastname = customerDetailsResponse.data?.lastName!;
          String? customerRefId =
              customerDetailsResponse.data?.referenceId!.toString();
          saveCustomerName(firstName! + " " + lastname!);
          return GetCustomerDetailsResponse.fromJson(data);
        });
  }
}
