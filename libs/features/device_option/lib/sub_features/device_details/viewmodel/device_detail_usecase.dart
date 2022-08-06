import 'package:network_manager/auth/auth_manager.dart';
import 'package:task_manager/base_classes/base_data_provider.dart';
import 'package:task_manager/task.dart';
import 'package:task_manager/task_manager_impl.dart';
import 'package:shared_data_models/detail_detail/device_details.dart';
import '../../../device_option_module.dart';
import '../service/device_option_service.dart';
import 'package:shared_data_models/customer_select_device/customer_select_device_response/customer_select_device_response.dart';

class DeviceDetailUseCase extends BaseDataProvider {
  DeviceDetailUseCase(TaskManager taskManager, this._authManager)
      : super(taskManager);
  final IAuthManager _authManager;

  Future<DeviceDetails?> getDeviceDetail(
      int deviceId, Function(String) onErrorCallback) async {
    String? token = await _authManager.getAccessToken();
    return await executeApiRequest<DeviceDetails?>(
        taskType: TaskType.DATA_OPERATION,
        taskSubType: TaskSubType.REST,
        moduleIdentifier: DeviceOptionModule.moduleIdentifier,
        requestData: {'deviceId': deviceId, 'token': token},
        serviceIdentifier: IDeviceOptionService.deviceDetailIdentifier,
        onError: onErrorCallback,
        modelBuilderCallback: (responseData) {
          final data = responseData;
          DeviceDetails deviceListResponse = DeviceDetails.fromJson(data);
          return DeviceDetails.fromJson(data);
        });
  }

  Future<CustomerSelectDeviceResponse?> selectDevice(
      int deviceId, Function(String) onErrorCallback) async {
    String? token = await _authManager.getAccessToken();
    return await executeApiRequest<CustomerSelectDeviceResponse?>(
        taskType: TaskType.DATA_OPERATION,
        taskSubType: TaskSubType.REST,
        moduleIdentifier: DeviceOptionModule.moduleIdentifier,
        requestData: {'deviceId': deviceId, 'token': token, 'customerId': 36},
        serviceIdentifier: IDeviceOptionService.selectDeviceIdentifier,
        onError: onErrorCallback,
        modelBuilderCallback: (responseData) {
          final data = responseData;
          return CustomerSelectDeviceResponse.fromMap(data);
        });
  }
}
