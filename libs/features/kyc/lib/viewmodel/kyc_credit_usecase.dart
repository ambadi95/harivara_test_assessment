import 'package:core/logging/logger.dart';
import 'package:kyc/kyc_credit_module.dart';
import 'package:kyc/subfeatures/kycmain/kyccreditmain_module.dart';
import 'package:kyc/subfeatures/kycmain/service/kyc_main_service.dart';
import 'package:network_manager/auth/auth_manager.dart';
import 'package:network_manager/model/response/network_standard_response.dart';
import 'package:shared_data_models/agent_onboard/agent_details/response/agent_details_response.dart';
import 'package:task_manager/base_classes/base_data_provider.dart';
import 'package:task_manager/task.dart';
import 'package:task_manager/task_manager_impl.dart';
import 'package:shared_data_models/kyc/kyc_check_response.dart';

import '../service/kyc_credit_service.dart';
import 'kyc_credit_viewmodel.dart';

class KycCreditUseCase extends BaseDataProvider {
  final KycCreditViewModel _kycCreditViewModel;

  KycCreditUseCase(this._kycCreditViewModel, TaskManager taskManager)
      : super(taskManager);

  Future<String> getMobileNumber() async {
    return await getValueFromSecureStorage('mobileNumber', defaultValue: '');
  }

  Future<String> getCustomerId() async {
    return await getValueFromSecureStorage('customerId', defaultValue: '');
  }

  Future<KycCheckResponse?> callKycCheck(
      String mobileNumber, Function(String) onErrorCallback) async {
    return await executeApiRequest<KycCheckResponse?>(
        taskType: TaskType.DATA_OPERATION,
        taskSubType: TaskSubType.REST,
        moduleIdentifier: KycCreditModule.moduleIdentifier,
        requestData: {
          "mobileNumber": mobileNumber,
        },
        serviceIdentifier: KycCreditService.kycCheckIdentifier,
        onError: onErrorCallback,
        modelBuilderCallback: (responseData) {
          return KycCheckResponse.fromJson(responseData);
        });
  }

  Future<KycCheckResponse?> callCreditCheck(
      String customerId, Function(String) onErrorCallback) async {
    return await executeApiRequest<KycCheckResponse?>(
        taskType: TaskType.DATA_OPERATION,
        taskSubType: TaskSubType.REST,
        moduleIdentifier: KycCreditModule.moduleIdentifier,
        requestData: {
          "customerId": int.parse(customerId),
        },
        serviceIdentifier: KycCreditService.creditCheckIdentifier,
        onError: onErrorCallback,
        modelBuilderCallback: (responseData) {
          KycCheckResponse checkResponse;
          try {
            checkResponse = KycCheckResponse.fromJson(responseData);
          } catch (e) {
            checkResponse = const KycCheckResponse(
                status: false, code: "400", message: "Something went wrong");
          }
          return checkResponse;
        });
  }

  Future<KycCheckResponse?> callCreditScore(
      String customerId, Function(String) onErrorCallback) async {
    return await executeApiRequest<KycCheckResponse?>(
        taskType: TaskType.DATA_OPERATION,
        taskSubType: TaskSubType.REST,
        moduleIdentifier: KycCreditModule.moduleIdentifier,
        requestData: {
          "consent" : "accepted",
          "customerId": int.parse(customerId),
        },
        serviceIdentifier: KycCreditService.creditScoreIdentifier,
        onError: onErrorCallback,
        modelBuilderCallback: (responseData) {
          KycCheckResponse checkResponse;
          try {
            checkResponse = KycCheckResponse.fromJson(responseData);
          } catch (e) {
            checkResponse = const KycCheckResponse(
                status: false, code: "400", message: "Something went wrong");
          }
          return checkResponse;
        });
  }
}
