import 'package:network_manager/auth/auth_manager.dart';
import 'package:shared_data_models/auth/auth_detail.dart';
import 'package:shared_data_models/customer_onboard/membership/request/membership_request.dart';
import 'package:shared_data_models/customer_onboard/membership/response/device_listl_response/device_listl_response.dart';
import 'package:task_manager/base_classes/base_data_provider.dart';
import 'package:task_manager/task.dart';
import 'package:task_manager/task_manager_impl.dart';

import '../device_option_module.dart';
import '../sub_features/device_details/service/device_option_service.dart';

class DeviceOptionUseCase extends BaseDataProvider {
  final IAuthManager _authManager;

  DeviceOptionUseCase(this._authManager,TaskManager taskManager) : super(taskManager);

  Future<DeviceListlResponse?> getDeviceList(
      Function(String) onErrorCallback) async {


    final customerId = _authManager.getUserInfo(UserDetailsLabel.id.name);
    String? id;

    customerId.then((value) => id = value);

    MembershipRequest membershipRequest = MembershipRequest(customerId: int.parse(id!));

    return await executeApiRequest<DeviceListlResponse?>(
        taskType: TaskType.DATA_OPERATION,
        taskSubType: TaskSubType.REST,
        moduleIdentifier: DeviceOptionModule.moduleIdentifier,
        requestData: membershipRequest.toJson(),
        serviceIdentifier: IDeviceOptionService.deviceOptionIdentifier,
        onError: onErrorCallback,
        modelBuilderCallback: (responseData) {
          final data = responseData;
          DeviceListlResponse deviceListResponse = DeviceListlResponse.fromJson(data);
          return DeviceListlResponse.fromJson(data);
        });
  }

  Future<DeviceListlResponse?> getDeviceDetail(String deviceId,
      Function(String) onErrorCallback) async {
    return await executeApiRequest<DeviceListlResponse?>(
        taskType: TaskType.DATA_OPERATION,
        taskSubType: TaskSubType.REST,
        moduleIdentifier: DeviceOptionModule.moduleIdentifier,
        serviceIdentifier: IDeviceOptionService.deviceDetailIdentifier,
        onError: onErrorCallback,
        modelBuilderCallback: (responseData) {
          final data = responseData;
          DeviceListlResponse deviceListResponse = DeviceListlResponse.fromJson(data);
          return DeviceListlResponse.fromJson(data);
        });
  }

}
