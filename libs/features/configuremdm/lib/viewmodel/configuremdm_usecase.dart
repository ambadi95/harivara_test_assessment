import 'package:configuremdm/configuremdm_module.dart';
import 'package:configuremdm/service/configure_mdm_service.dart';
import 'package:configuremdm/viewmodel/configuremdm_viewmodel.dart';
import 'package:shared_data_models/commonresponse/common_response.dart';
import 'package:task_manager/base_classes/base_data_provider.dart';
import 'package:task_manager/task.dart';
import 'package:task_manager/task_manager_impl.dart';

class ConfigureMdmUseCase extends BaseDataProvider {
  final ConfigureMdmViewModel _configuremdmviewmodel;

  ConfigureMdmUseCase(this._configuremdmviewmodel, TaskManager taskManager)
      : super(taskManager);

  Future<String> getAgentName() async {
    return await getValueFromSecureStorage('agentName', defaultValue: '');
  }

  Future<String> getCustomerId() async {
    return await getValueFromSecureStorage('customerId', defaultValue: '');
  }

  Future<CommonResponse?> mdmRegistration(
      String imei, Function(String) onErrorCallback) async {
    String customerId = await getCustomerId();
    return await executeApiRequest<CommonResponse?>(
        taskType: TaskType.DATA_OPERATION,
        taskSubType: TaskSubType.REST,
        moduleIdentifier: ConfigureMdmModule.moduleIdentifier,
        requestData: {'customerId':67, 'imei': imei},
        serviceIdentifier: IConfigureMdmService.mdmRegistrationIdentifier,
        onError: onErrorCallback,
        modelBuilderCallback: (responseData) {
          final data = responseData;
          CommonResponse commonResponse;
          try {
            commonResponse = CommonResponse.fromMap(data);
            return commonResponse;
          } catch (e) {
            commonResponse = const CommonResponse(
                status: false,
                message: "Something went wrong,Please try again later!");
            return commonResponse;
          }
        });
  }
}
