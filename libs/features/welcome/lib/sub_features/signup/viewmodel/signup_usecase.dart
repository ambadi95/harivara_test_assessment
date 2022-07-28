
import 'package:core/mobile_core.dart';
import 'package:task_manager/base_classes/base_data_provider.dart';
import 'package:task_manager/task_manager_impl.dart';
import 'package:welcome/sub_features/signup/viewmodel/signup_viewmodel.dart';

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

  Future<void> _saveMobileNumber(String mobileNumber) async {
    return await setValueToStorage({'mobileNumber': mobileNumber});
  }

}