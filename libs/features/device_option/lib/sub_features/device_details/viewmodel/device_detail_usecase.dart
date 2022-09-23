import 'package:network_manager/auth/auth_manager.dart';
import 'package:shared_data_models/device_option/customer-device/customer_detail_response.dart';
import 'package:task_manager/base_classes/base_data_provider.dart';
import 'package:task_manager/task.dart';
import 'package:task_manager/task_manager_impl.dart';
import 'package:shared_data_models/detail_detail/device_details.dart';
import '../../../device_option_module.dart';
import '../service/device_option_service.dart';
import 'package:shared_data_models/customer_select_device/customer_select_device_response/customer_select_device_response.dart';
import 'package:shared_data_models/device_option/detail_detail_response/detail_detail_response.dart';

class DeviceDetailUseCase extends BaseDataProvider {
  DeviceDetailUseCase(TaskManager taskManager, this._authManager)
      : super(taskManager);
  final IAuthManager _authManager;

  Future<String> getCustomerId() async {
    return await getValueFromSecureStorage('customerId', defaultValue: '');
  }

  Future<void> saveModelName(String? modelName) async {
    return await setValueToSecureStorage({'ModelName': modelName});
  }

  Future<DetailDetailResponse?> getDeviceDetail(
      int deviceId, Function(String) onErrorCallback) async {
    String? token = await _authManager.getAccessToken();
    return await executeApiRequest<DetailDetailResponse?>(
        taskType: TaskType.DATA_OPERATION,
        taskSubType: TaskSubType.REST,
        moduleIdentifier: DeviceOptionModule.moduleIdentifier,
        requestData: {'deviceId': deviceId, 'token': token},
        serviceIdentifier: IDeviceOptionService.deviceDetailIdentifier,
        onError: onErrorCallback,
        modelBuilderCallback: (responseData) {
          final data = responseData;
          DetailDetailResponse deviceListResponse =
              DetailDetailResponse.fromMap(data);
          String? brand = deviceListResponse.data?.brand;
          String? model = deviceListResponse.data?.modelNumber;
          saveModelName(brand! + "-" + model!);
          return DetailDetailResponse.fromMap(data);
        });
  }

  Future<CustomerSelectDeviceResponse?> selectDevice(
      int deviceId, Function(String) onErrorCallback) async {
    String? token = await _authManager.getAccessToken();
    String customerId = await getCustomerId();

    return await executeApiRequest<CustomerSelectDeviceResponse?>(
        taskType: TaskType.DATA_OPERATION,
        taskSubType: TaskSubType.REST,
        moduleIdentifier: DeviceOptionModule.moduleIdentifier,
        requestData: {
          'deviceId': deviceId,
          //'token': token,
          'customerId': int.parse(customerId)
        },
        serviceIdentifier: IDeviceOptionService.selectDeviceIdentifier,
        onError: onErrorCallback,
        modelBuilderCallback: (responseData) {
          final data = responseData;
          try {
            return CustomerSelectDeviceResponse.fromMap(data);
          }catch(e) {

            return CustomerSelectDeviceResponse(status: false,message: "Something went wrong,Please try again later!");

          }
        });
  }


  }
