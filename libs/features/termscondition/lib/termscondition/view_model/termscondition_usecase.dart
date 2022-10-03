import 'package:shared_data_models/termscondition_faq_screen_args/request/term_condition_request.dart';
import 'package:shared_data_models/termscondition_faq_screen_args/response/term_condition_response.dart';
import 'package:task_manager/base_classes/base_data_provider.dart';
import 'package:task_manager/task.dart';
import 'package:task_manager/task_manager_impl.dart';
import 'package:termscondition/termscondition/view_model/termsconditon_viewmodel.dart';

import '../service/term_condition_service.dart';
import '../termscondition_module.dart';

class TermsConditionUseCase extends BaseDataProvider {
  final TermsConditionViewModel _termsconditionViewModel;
  TermsConditionUseCase(this._termsconditionViewModel, TaskManager taskManager)
      : super(taskManager);


  Future<String> getAgentId() async {
    return await getValueFromSecureStorage('agentId', defaultValue: '');
  }

  Future<String> getCustomerId() async {
    return await getValueFromSecureStorage('customerId', defaultValue: '');
  }


  Future<TermConditionResponse?> saveConsentAgent(Function(String) onErrorCallback) async {
    String agentId = await getAgentId();
    return await executeApiRequest<TermConditionResponse?>(
        taskType: TaskType.DATA_OPERATION,
        taskSubType: TaskSubType.REST,
        moduleIdentifier: TermsConditionModule.moduleIdentifier,
        requestData: {
          "y9AgentId": agentId,
          "consent" : "accepted"
        },
        serviceIdentifier: ITermConditionService.SaveConsentByAgentIdentifier,
        onError: onErrorCallback,
        modelBuilderCallback: (responseData) {
          final data = responseData;
          return TermConditionResponse.fromJson(data);
        });
  }

  Future<TermConditionResponse?> saveConsentCustomer(Function(String) onErrorCallback) async {
    String customerId = await getCustomerId();
    return await executeApiRequest<TermConditionResponse?>(
        taskType: TaskType.DATA_OPERATION,
        taskSubType: TaskSubType.REST,
        moduleIdentifier: TermsConditionModule.moduleIdentifier,
        requestData: {
          "customerId": int.parse(customerId),
          "consent" : "accepted"
        },
        serviceIdentifier: ITermConditionService.SaveConsentByCustomerIdentifier,
        onError: onErrorCallback,
        modelBuilderCallback: (responseData) {
          final data = responseData;
          return TermConditionResponse.fromJson(data);
        });
  }
}
