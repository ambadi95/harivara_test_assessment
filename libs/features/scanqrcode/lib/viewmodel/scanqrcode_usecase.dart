

import 'package:scanqrcode/service/scanqrcode_service.dart';
import 'package:scanqrcode/viewmodel/scanqrcode_viewmodel.dart';
import 'package:task_manager/base_classes/base_data_provider.dart';
import 'package:task_manager/task.dart';
import 'package:task_manager/task_manager_impl.dart';
import 'package:shared_data_models/scan_qr_code/response/scan_qr_code_response.dart';
import 'dart:async';
import '../scanqrcode_module.dart';

class ScanQRCodeUseCase extends BaseDataProvider {
  final ScanQRCodeViewModel _scanQRCodeViewModel;

  ScanQRCodeUseCase(this._scanQRCodeViewModel, TaskManager taskManager)
      : super(taskManager);


  Future<String> getNewCustomerName() async {
    return await getValueFromSecureStorage('newCustomerName', defaultValue: '');
  }

  Future<String> getCustomerId() async {
    return await getValueFromSecureStorage('customerId', defaultValue: '');
  }

  Future<String> getDeviceId() async {
    return await getValueFromSecureStorage('deviceId', defaultValue: '');
  }

  bool isValidIMEINumber(String imeiNumber) {
    return _scanQRCodeViewModel.isValidIMEINumber(imeiNumber);
  }

  Future<void> saveDeviceRegistrationStatus(String? status) async {
    return await setValueToSecureStorage({'deviceRegistrationStatus': status});
  }

  Future<ScanQRCodeResponse?> deviceRegistrationAPI(int deviceId, String imei1, String imei2,
      Function(String) onErrorCallback) async {
    String customerId = await getCustomerId();
    return await executeApiRequest<ScanQRCodeResponse?>(
        taskType: TaskType.DATA_OPERATION,
        taskSubType: TaskSubType.REST,
        moduleIdentifier: ScanQRCodeModule.moduleIdentifier,
        requestData: {
          "customerId": int.parse(customerId),
          "deviceId": deviceId,//int.parse(deviceId),
          "imei1": imei1,
          "imei2": imei2
        },
        serviceIdentifier: IScanQRCodeService.deviceRegisterIdentifier,
        onError: onErrorCallback,
        modelBuilderCallback: (responseData) {
          ScanQRCodeResponse checkResponse;
          try {
            checkResponse = ScanQRCodeResponse.fromJson(responseData);
          } catch (e) {
            checkResponse = const ScanQRCodeResponse(
                status: false, code: "400", message: "Something went wrong");
          }
          return checkResponse;
        });
  }


}
