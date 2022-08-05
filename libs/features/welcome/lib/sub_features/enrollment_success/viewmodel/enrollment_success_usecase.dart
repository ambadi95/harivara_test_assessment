
import 'package:shared_data_models/customer_onboard/customer_details/response/customer_detail_response.dart';
import 'package:task_manager/base_classes/base_data_provider.dart';
import 'package:task_manager/task_manager.dart';
import 'package:task_manager/task_manager_impl.dart';
import 'package:welcome/sub_features/enrollment_success/service/enrollment_service.dart';
import '../../../welcome_module.dart';

class EnrollmentSuccessUseCase extends BaseDataProvider{
  EnrollmentSuccessUseCase(TaskManager taskManager) : super(taskManager);


  Future<String> getCustomerId() async {
    return await getValueFromStorage('customerId', defaultValue: '');
  }


  Future<CustomerDetailResponse?> getCustomerDetails(Function(String) onErrorCallback) async {
    String id = await getCustomerId();
    return await executeApiRequest<CustomerDetailResponse?>(
        taskType: TaskType.DATA_OPERATION,
        taskSubType: TaskSubType.REST,
        moduleIdentifier: WelcomeModule.moduleIdentifier,
        requestData: {"customerId": id},
        serviceIdentifier: IEnrollmentService.enrollmentIdentifier,
        onError: onErrorCallback,
        modelBuilderCallback: (responseData) {
          final data = responseData;
          return CustomerDetailResponse.fromJson(data);
        });
  }

}