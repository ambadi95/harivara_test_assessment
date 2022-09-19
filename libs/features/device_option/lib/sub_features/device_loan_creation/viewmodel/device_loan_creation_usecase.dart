import 'package:network_manager/auth/auth_manager.dart';
import 'package:shared_data_models/device_option/detail_detail_response/data.dart';
import 'package:shared_data_models/deviceloancreation/data.dart';
import 'package:shared_data_models/deviceloancreation/loan_preview_response_model.dart';
import 'package:task_manager/base_classes/base_data_provider.dart';
import 'package:task_manager/task.dart';
import 'package:task_manager/task_manager_impl.dart';

import '../../../device_option_module.dart';
import '../../device_details/service/device_option_service.dart';

class DeviceLoanCreationUseCase extends BaseDataProvider {
  DeviceLoanCreationUseCase(TaskManager taskManager, this._authManager)
      : super(taskManager);
  final IAuthManager _authManager;

  Future<String> getTelcoPartner() async {
    return await getValueFromStorage('telcoPartner', defaultValue: '');
  }


  Future<LoanPreviewResponseModel?> getLoanPreview(
      int deviceId, Function(String) onErrorCallback) async {
    String? token = await _authManager.getAccessToken();
    return await executeApiRequest<LoanPreviewResponseModel?>(
        taskType: TaskType.DATA_OPERATION,
        taskSubType: TaskSubType.REST,
        moduleIdentifier: DeviceOptionModule.moduleIdentifier,
        requestData: {'deviceId': deviceId},
        serviceIdentifier: IDeviceOptionService.loanPreviewIdentifier,
        onError: onErrorCallback,
        modelBuilderCallback: (responseData) {
          LoanPreviewResponseModel loanPreviewResponseModel;

          try {
             loanPreviewResponseModel =
            LoanPreviewResponseModel.fromMap(responseData);
             return loanPreviewResponseModel;
          }catch(e){
            loanPreviewResponseModel = LoanPreviewResponseModel(status: false,message: "Something went wrong,Please try again later");
          }
          return loanPreviewResponseModel;
        });
  }
}
