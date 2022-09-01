import 'package:task_manager/task_manager.dart';
import '../sub_features/device_details/service/device_option_service.dart';

class DeviceDetailApiResolver extends TaskResolver {
  final IDeviceOptionService _deviceDetailService;

  DeviceDetailApiResolver(this._deviceDetailService);

  @override
  Future execute(String identifier, Map<String, dynamic> requestData) {
    switch (identifier) {
      case IDeviceOptionService.deviceOptionIdentifier:
        return _deviceDetailService.deviceList(
          int.parse(requestData['customerId']),
        );
      case IDeviceOptionService.deviceDetailIdentifier:
        return _deviceDetailService.deviceDetail(
            requestData['deviceId'], requestData['token']);
      case IDeviceOptionService.selectDeviceIdentifier:
        return _deviceDetailService.selectDevice(requestData['customerId'],
            requestData['deviceId'], requestData['token']);
      case IDeviceOptionService.loanPreviewIdentifier:
        return _deviceDetailService.loanPreview(requestData['deviceId']);
      default:
        throw UnimplementedError();
    }
  }
}
