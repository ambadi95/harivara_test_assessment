
import 'package:referral_program/referral_program_module.dart';
import 'package:shared_data_models/commonresponse/common_response.dart';
import 'package:shared_data_models/referral_program_response/referral_program_list_respobse/referral_program_list_respobse.dart';
import 'package:task_manager/base_classes/base_data_provider.dart';
import 'package:task_manager/task.dart';
import 'package:task_manager/task_manager_impl.dart';

import '../service/referral_program_service.dart';

class ReferralProgramUseCase extends BaseDataProvider {
  ReferralProgramUseCase( TaskManager taskManager)
      : super(taskManager);

  Future<void> saveSelectedFilterIndex(String selectedFilter) async {
    await setValueToStorage({'select_filter_index': selectedFilter});
  }
  Future<String> getSelectedFilterIndex() async {
    return await getValueFromStorage('select_filter_index', defaultValue: '');
  }

  Future<String> getCustomerId() async {
    return await getValueFromSecureStorage('customerId', defaultValue: '');
  }

  Future<void> saveSelectedFilter(String selectedFilter) async {
    await setValueToStorage({'select_filter': selectedFilter});
  }



  Future<String> getSelectedFilter() async {
    return await getValueFromStorage('select_filter', defaultValue: '');
  }


  bool isValidMobileNumber(String mobileNumber) {
    var reg = RegExp(r'^(\+\d{1,3}[- ]?)?\d{9}$');
    var isValid = mobileNumber.length == 9;
    return isValid;
  }

  bool isValidEmailId(String emailId) {
    var reg = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    var isValid = reg.hasMatch(emailId);
    return isValid;
  }

  bool isValidName(String name) {
    var reg = RegExp(r"^\s*([A-Za-z]{1,}([\.,] |[-']| ))+[A-Za-z]+\.?\s*$");
    var isValid = reg.hasMatch(name);
    return isValid;
  }

  Future<CommonResponse?> callInviteFriend(
      Function(String) onErrorCallback,{String? customerName="",String emailId="",String mobileNo="",String customerId=""}) async {
    return await executeApiRequest<CommonResponse?>(
        taskType: TaskType.DATA_OPERATION,
        taskSubType: TaskSubType.REST,
        moduleIdentifier: ReferralProgramModule.moduleIdentifier,
        requestData: {
          "customerName": customerName,
          "emailId": emailId,
          "mobileNo":'+255'+mobileNo.replaceAll(" ", ""),
          "customerId": int.parse(customerId)
        },
        serviceIdentifier: IReferralProgramService.inviteFriendIdentifier,
        onError: onErrorCallback,
        modelBuilderCallback: (responseData) {
          final data = responseData;
            CommonResponse commonResponse = CommonResponse.fromMap(data);
            return commonResponse;

        });
  }

  Future<ReferralProgramListResponse?> getReferenceList(
      Function(String) onErrorCallback,String filter) async {
    String customerId = await getCustomerId();
    return await executeApiRequest<ReferralProgramListResponse?>(
        taskType: TaskType.DATA_OPERATION,
        taskSubType: TaskSubType.REST,
        moduleIdentifier: ReferralProgramModule.moduleIdentifier,
        requestData: {
          "customerId": customerId,
          "filter" : filter
        },
        serviceIdentifier: IReferralProgramService.referralListIdentifier,
        onError: onErrorCallback,
        modelBuilderCallback: (responseData) {
          final data = responseData;
          ReferralProgramListResponse referralProgramListResponse = ReferralProgramListResponse.fromMap(data);
          return referralProgramListResponse;
        });
  }
}
