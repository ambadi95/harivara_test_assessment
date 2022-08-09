import 'package:task_manager/base_classes/base_data_provider.dart';
import 'package:task_manager/task.dart';
import 'package:task_manager/task_manager_impl.dart';
import 'package:shared_data_models/agent_onboard/agent_details/response/agent_details_response.dart';
import 'package:welcome/sub_features/agent_details/service/agent_details_service.dart';
import 'package:shared_data_models/agent_onboard/agent_details/request/agent_details_request.dart';
import '../../../welcome_module.dart';
import 'agent_details_view_model.dart';

class AgentDetailsUseCase extends BaseDataProvider {
  final AgentDetailsViewModel agentDetailsViewModel;
  AgentDetailsUseCase(this.agentDetailsViewModel, TaskManager taskManager)
      : super(taskManager);

  bool isValidName(String name) {
    return agentDetailsViewModel.isValidName(name);
  }

  bool isValidEmail(String emailId) {
    return agentDetailsViewModel.isValidEmailId(emailId);
  }

  bool isValidMobile(String mobileNo) {
    return agentDetailsViewModel.isValidMobileNumber(mobileNo);
  }

  Future<String> getMobileNumber() async {
    return await getValueFromSecureStorage('mobileNumber', defaultValue: '');
  }

  Future<void> saveAgentName(String agentName) async {
    await setValueToSecureStorage({'agentName': agentName});
  }

  Future<String> getAgentId() async {
    return await getValueFromSecureStorage('agentId', defaultValue: '');
  }

  Future<AgentDetailsResponse?> getAgentDetail(
      Function(String) onErrorCallback) async {
    String agentId = await getAgentId();
    return await executeApiRequest<AgentDetailsResponse?>(
        taskType: TaskType.DATA_OPERATION,
        taskSubType: TaskSubType.REST,
        moduleIdentifier: WelcomeModule.moduleIdentifier,
        requestData: {"agentId": agentId},
        serviceIdentifier: IAgentDetailsService.detailIdentifier,
        onError: onErrorCallback,
        modelBuilderCallback: (responseData) {
          final data = responseData;
          return AgentDetailsResponse.fromJson(data);
        });
  }

  Future<AgentDetailsResponse?> submitCustomerDetails(
      String agentId,
      String firstName,
      String lastName,
      String middleName,
      String nidaNo,
      String dob,
      String gender,
      String mobileNo,
      String emailId,
      Function(String) onErrorCallback) async {
    AgentDetailsRequest agentDetailRequest = AgentDetailsRequest(
        y9AgentId: agentId,
        firstName: firstName,
        lastName: lastName,
        middleName: middleName,
        nidaNo: nidaNo,
        mobileNo: mobileNo,
        emailId: emailId,
        birthdate: dob,
        gender: gender);
    return await executeApiRequest<AgentDetailsResponse?>(
        taskType: TaskType.DATA_OPERATION,
        taskSubType: TaskSubType.REST,
        moduleIdentifier: WelcomeModule.moduleIdentifier,
        requestData: agentDetailRequest.toMap(),
        serviceIdentifier: IAgentDetailsService.submitAgentDetailIdentifier,
        onError: onErrorCallback,
        modelBuilderCallback: (responseData) {
          final data = responseData;
          return AgentDetailsResponse.fromJson(data);
        });
  }
}
