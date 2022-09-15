import 'package:core/logging/logger.dart';
import 'package:network_manager/auth/auth_manager.dart';
import 'package:shared_data_models/auth/auth_detail.dart';
import 'package:shared_data_models/customer_onboard/membership/request/membership_request.dart';
import 'package:shared_data_models/customer_onboard/membership/response/device_list_response/device_list_response.dart';
import 'package:task_manager/base_classes/base_data_provider.dart';
import 'package:task_manager/task.dart';
import 'package:task_manager/task_manager_impl.dart';

import '../device_option_module.dart';
import '../sub_features/device_details/service/device_option_service.dart';

class DeviceOptionUseCase extends BaseDataProvider {
  final IAuthManager _authManager;

  DeviceOptionUseCase(this._authManager, TaskManager taskManager)
      : super(taskManager);

  Future<String> getCustomerId() async {
    return await getValueFromSecureStorage('customerId', defaultValue: '');
  }

  Future<DeviceListResponse?> getDeviceList(
      Function(String) onErrorCallback) async {
    String id = await getCustomerId();

    MembershipRequest membershipRequest =
        MembershipRequest(customerId: int.parse(id));
    String? token = await _authManager.getAccessToken();

    return await executeApiRequest<DeviceListResponse?>(
        taskType: TaskType.DATA_OPERATION,
        taskSubType: TaskSubType.REST,
        moduleIdentifier: DeviceOptionModule.moduleIdentifier,
        requestData: {'customerId': id, 'token': token},
        serviceIdentifier: IDeviceOptionService.deviceOptionIdentifier,
        onError: onErrorCallback,
        modelBuilderCallback: (responseData) {
          final data = responseData;
          DeviceListResponse deviceListResponse =
              DeviceListResponse.fromJson(data);
          return DeviceListResponse.fromJson(data);
        });
  }

  Future<void> saveDeviceId(String? deviceId) async {
    return await setValueToSecureStorage({'deviceId': deviceId});
  }

  // Future<DeviceListResponse?> getDeviceDetail(
  //     String deviceId, Function(String) onErrorCallback) async {
  //   return await executeApiRequest<DeviceListResponse?>(
  //       taskType: TaskType.DATA_OPERATION,
  //       taskSubType: TaskSubType.REST,
  //       moduleIdentifier: DeviceOptionModule.moduleIdentifier,
  //       serviceIdentifier: IDeviceOptionService.deviceDetailIdentifier,
  //       onError: onErrorCallback,
  //       modelBuilderCallback: (responseData) {
  //         final data = responseData;
  //         DeviceListResponse deviceListResponse =
  //         DeviceListResponse.fromJson(data);
  //         return DeviceListResponse.fromJson(data);
  //       });
  // }
}
