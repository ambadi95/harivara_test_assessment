
import 'package:task_manager/task_manager.dart';
import '../sub_features/device_details/service/device_option_service.dart';

class DeviceDetailApiResolver extends TaskResolver {
  final IDeviceOptionService _deviceDetailService;

  DeviceDetailApiResolver(this._deviceDetailService);

  @override
  Future execute(String identifier, Map<String, dynamic> requestData) {
    switch (identifier) {
      case IDeviceOptionService.deviceOptionIdentifier:
        return _deviceDetailService.deviceList(requestData);
      case IDeviceOptionService.deviceDetailIdentifier:
        return _deviceDetailService.deviceDetail(requestData['customerId']);
      default:
        throw UnimplementedError();
    }
  }
}
