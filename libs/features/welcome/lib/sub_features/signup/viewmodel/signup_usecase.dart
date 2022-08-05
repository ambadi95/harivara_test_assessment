
import 'package:core/mobile_core.dart';
import 'package:shared_data_models/customer_onboard/customer_details/response/customer_detail_response.dart';
import 'package:task_manager/base_classes/base_data_provider.dart';
import 'package:task_manager/task_manager.dart';
import 'package:task_manager/task_manager_impl.dart';
import 'package:welcome/sub_features/signup/viewmodel/signup_viewmodel.dart';

import '../../../welcome_module.dart';
import '../service/signup_service.dart';

class SignupUseCase extends BaseDataProvider{
  final SignupViewModel _signupViewModel;
  SignupUseCase(this._signupViewModel,TaskManager taskManager) : super(taskManager);

  bool isValidNINDAnumber(String nidaNumber){
    return _signupViewModel.isValidNidaNumber(nidaNumber);
  }
  bool isValidMobileNumber(String mobileNumber){
    return _signupViewModel.isValidMobileNumber(mobileNumber);
  }

  bool isValidAgentId(String agentId){
    return agentId.isNotEmptyOrNull;
  }

  Future<void> saveDetails(String nidaNumber, String mobileNumber) async{
    await _saveNIDANumber(nidaNumber);
    await _saveMobileNumber(mobileNumber);
  }

  Future<void> _saveNIDANumber(String nidaNumber) async {
    return await setValueToStorage({'nidaNumber': nidaNumber});
  }

  Future<void> saveCustomerId(String? customerId ) async {
    return await setValueToStorage({'customerId': customerId});
  }

  Future<void> _saveMobileNumber(String mobileNumber) async {
    return await setValueToStorage({'mobileNumber': mobileNumber});
  }

  Future<CustomerDetailResponse?> signUp(String nindaNumber, String phoneNo,
      Function(String) onErrorCallback) async {
    return await executeApiRequest<CustomerDetailResponse?>(
        taskType: TaskType.DATA_OPERATION,
        taskSubType: TaskSubType.REST,
        moduleIdentifier: WelcomeModule.moduleIdentifier,
        requestData: {"nindaNumber": nindaNumber, "phoneNo": phoneNo},
        serviceIdentifier: ISignupService.signupIdentifier,
        onError: onErrorCallback,
        modelBuilderCallback: (responseData) {
          final data = responseData;
          return CustomerDetailResponse.fromJson(data);
        });
  }

}