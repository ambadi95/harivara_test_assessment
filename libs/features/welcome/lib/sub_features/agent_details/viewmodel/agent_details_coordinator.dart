import 'package:core/mobile_core.dart';
import 'package:task_manager/base_classes/base_view_model.dart';
import '../../../navigation_handler/welcome_navigation_handler.dart';
import '../state/agent_details_state.dart';
import 'agent_details_usecase.dart';

class AgentDetailsCoordinator extends BaseViewModel<AgentDetailsState> {
  final AgentDetailsUseCase _agentDetailsUseCase;
  final WelcomeNavigationHandler _navigationHandler;

  AgentDetailsCoordinator(
    this._navigationHandler,
    this._agentDetailsUseCase,
  ) : super(const AgentDetailsState.initialState());

  void goBack() async {
    _navigationHandler.goBack();
  }

  Future getAgentDetail() async {
    var response = await _agentDetailsUseCase.getAgentDetail((p0) => null);
    if (response?.status == true) {
      return response?.data;
    }
    return null;
  }

  Future submitAgentDetail(
      String agentId,
      String firstName,
      String lastName,
      String? middleName,
      String nidaNo,
      String? dob,
      String? gender,
      String mobileNo,
      String emailId) async {
    var submitResponse = await _agentDetailsUseCase.submitCustomerDetails(
        agentId,
        firstName,
        lastName,
        middleName ?? ' ',
        nidaNo,
        dob ?? ' ',
        gender!,
        mobileNo,
        emailId,
        (p0) => null);
    if (submitResponse?.status == true) {
      navigateToOtpScreen(mobileNo, firstName + ' ' + lastName);
      // _navigationHandler.navigateToOtpScreen('Agent', agentId, mobileNo);
    } else {
      CrayonPaymentLogger.logError(submitResponse!.message!);
    }
  }

  bool _validateForm(String name, String dob, String gender, String mobNumber,
      String emailId) {
    var isnNameValid = name.isNotEmpty;
    var isMobileNoValid = mobNumber.isNotEmpty;
    var isDobValid = dob.isNotEmpty;
    var isGenderValid = gender.isNotEmpty;
    var isEmailIdValid = emailId.isNotEmpty;
    var _isValid = isnNameValid &&
        isMobileNoValid &&
        isDobValid &&
        isGenderValid &&
        isEmailIdValid;
    return _isValid;
  }

  void validateForm(String name, String dob, String gender, String mobNumber,
      String emailId) {
    state = AgentDetailsState.DetailsFormState(
        _validateForm(name, dob, gender, mobNumber, emailId));
  }

  Future navigateToOtpScreen(String mobileNumber, String agentName) async {
    await _agentDetailsUseCase.saveAgentName(agentName);
    String agentId = await _agentDetailsUseCase.getAgentId();
    _navigationHandler.navigateToOtpScreen('Agent', agentId, mobileNumber);
  }

  Future navigateToBottomSheet() async {
    _navigationHandler.navigateToAgentEnrollmentBottomSheet('das');
  }

  bool isValidName(String name) {
    bool result = _agentDetailsUseCase.isValidName(name);
    if (!result) {
      state = const AgentDetailsState.nameError('DV_name_error_text');
    } else {
      state = const AgentDetailsState.nameError('');
    }
    return result;
  }

  bool isValidMobileNumber(String mobileNumber) {
    bool result = _agentDetailsUseCase.isValidMobile(mobileNumber);
    if (!result) {
      state = const AgentDetailsState.mobileError('DV_contact_no_error_text');
    } else {
      state = const AgentDetailsState.mobileError('');
    }
    return result;
  }

  bool isValidEmail(String emailId) {
    bool result = _agentDetailsUseCase.isValidEmail(emailId);
    if (!result) {
      state = const AgentDetailsState.emailError('DV_email_error_text');
    } else {
      state = const AgentDetailsState.emailError('');
    }
    return result;
  }

  bool isValidDob(String dob) {
    var result = dob.isNotEmpty;
    if (!result) {
      state = const AgentDetailsState.dobError('DV_dob_error_text');
    } else {
      state = const AgentDetailsState.dobError('');
    }
    return result;
  }

  bool isValidGender(String gender) {
    var result = gender.isNotEmpty;
    if (!result) {
      state = const AgentDetailsState.genderError('DV_gender_error_text');
    } else {
      state = const AgentDetailsState.genderError('');
    }
    return result;
  }
}
