import 'package:kyc/subfeatures/kycmain/kyccreditmain_module.dart';
import 'package:kyc/subfeatures/kycmain/service/kyc_main_service.dart';
import 'package:shared_data_models/kyc/mno_consent_response.dart';
import 'package:task_manager/base_classes/base_data_provider.dart';
import 'package:task_manager/task.dart';
import 'package:task_manager/task_manager_impl.dart';

import 'kyc_credit_main_viewmodel.dart';

class KycCreditMainUseCase extends BaseDataProvider {
  final KycCreditMainViewModel _kycCreditMainViewModel;

  KycCreditMainUseCase(this._kycCreditMainViewModel, TaskManager taskManager)
      : super(taskManager);


  Future<MnoConsentResponse?> callMnoConsent(String customerId,
      Function(String) onErrorCallback) async {

    return  await executeApiRequest<MnoConsentResponse?>(
        taskType: TaskType.DATA_OPERATION,
        taskSubType: TaskSubType.REST,
        moduleIdentifier: KycCreditMainModule.moduleIdentifier,
        requestData:{
          "customerId": int.parse(customerId),
          "consent": "accepted"
        },
        serviceIdentifier: KycMainService.consentIndentifier,
        onError: onErrorCallback,
        modelBuilderCallback: (responseData) {
          final data = responseData;
          MnoConsentResponse mnoConsentResponse = MnoConsentResponse.fromJson(data);
          return mnoConsentResponse;
        });
  }

  Future<String> getCustomerId() async {
    return await getValueFromSecureStorage('customerId', defaultValue: '');
  }

}
