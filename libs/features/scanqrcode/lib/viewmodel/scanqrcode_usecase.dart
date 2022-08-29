
import 'package:scanqrcode/service/scanqrcode_service.dart';
import 'package:scanqrcode/viewmodel/scanqrcode_viewmodel.dart';
import 'package:task_manager/base_classes/base_data_provider.dart';
import 'package:task_manager/task.dart';
import 'package:task_manager/task_manager_impl.dart';
import 'package:shared_data_models/scan_qr_code/response/scan_qr_code_response.dart';
import 'package:shared_data_models/scan_qr_code/request/scanqrcode_request.dart';

import '../scanqrcode_module.dart';

class ScanQRCodeUseCase extends BaseDataProvider {
  final ScanQRCodeViewModel _scanQRCodeViewModel;

  ScanQRCodeUseCase(this._scanQRCodeViewModel, TaskManager taskManager)
      : super(taskManager);

  Future<String> getAgentName() async {
    return await getValueFromSecureStorage('agentName', defaultValue: '');
  }

  bool isValidIMEINumber(String imeiNumber) {
    return _scanQRCodeViewModel.isValidIMEINumber(imeiNumber);
  }

  Future<void> saveDeviceRegistrationStatus(String? status) async {
    return await setValueToSecureStorage({'deviceRegistrationStatus': status});
  }

  Future<ScanQRCodeResponse?> deviceRegistrationAPI(String customerId, int deviceId, String imei1, String imei2,
      Function(String) onErrorCallback) async {

    ScanQRCodeRequest scanQRCodeRequest = ScanQRCodeRequest(customerId, deviceId, imei1 , imei2 );
    return await executeApiRequest<ScanQRCodeResponse?>(
        taskType: TaskType.DATA_OPERATION,
        taskSubType: TaskSubType.REST,
        moduleIdentifier: ScanQRCodeModule.moduleIdentifier,
        requestData: scanQRCodeRequest.toJson(scanQRCodeRequest),
        serviceIdentifier: IScanQRCodeService.deviceRegisterIdentifier,
        onError: onErrorCallback,
        modelBuilderCallback: (responseData) {
          final data = responseData;
          ScanQRCodeResponse deviceResponse =
          ScanQRCodeResponse.fromJson(data);
          if (deviceResponse.data != null) {
            saveDeviceRegistrationStatus(deviceResponse.data!.status);
          }
          return ScanQRCodeResponse.fromJson(data);
        });
  }

}
