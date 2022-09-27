import 'package:task_manager/task_manager.dart';
import 'package:welcome/sub_features/details/service/details_service.dart';
import 'package:welcome/sub_features/enrollment_success/service/enrollment_service.dart';
import 'package:welcome/sub_features/welcome/service/perference_service.dart';
import '../sub_features/agent_details/service/agent_details_service.dart';
import '../sub_features/customer_profile_details/service/customer_details_service.dart';
import '../sub_features/signup/service/signup_service.dart';
import '../sub_features/welcome_back/service/welcome_back_service.dart';

class SignupApiResolver extends TaskResolver {
  final ISignupService _signupService;
  final IDetailsService _detailsService;
  final ICustomerDetailsService _customerDetailsService;
  final IEnrollmentService _enrollmentService;
  final IAgentDetailsService _agentDetailsService;
  final IWelcomeBackService _welcomeBackService;
  final IPreferencesService _preferencesService;

  SignupApiResolver(
    this._signupService,
    this._detailsService,
    this._enrollmentService,
    this._agentDetailsService,
    this._welcomeBackService,
    this._customerDetailsService,
      this._preferencesService
  );

  @override
  Future execute(String identifier, Map<String, dynamic> requestData) {
    switch (identifier) {
      case ISignupService.jwtIdentifier:
        return _signupService.jwttoken(requestData);
      case ISignupService.signupIdentifier:
        return _signupService.signup(
          requestData['nindaNumber'] as String,
          requestData['phoneNo'] as String,
        );
      case ISignupService.signUpAgentIdentifier:
        return _signupService.signupAgent(
          requestData['nidaNumber'] as String,
          requestData['agentId'] as String,
        );
      case ISignupService.signUpCustomerByAgent:
        return _signupService.signupCustomerByAgent(
            nidaNumber: requestData['nidaNumber'] as String,
            agentId: requestData['agentId'] as String,
            customerMobileNumber: requestData['mobileNo'] as String,
            token: requestData['token'] as String);
      case IDetailsService.regionIdentifier:
        return _detailsService.getRegion(requestData['userType']);
      case IDetailsService.districtIdentifier:
        return _detailsService.getDistrict(
            requestData['regionId'], requestData['userType']);
      case IDetailsService.getCustomerDetailIdentifier:
        return _detailsService.getCustomerDetail(
            requestData['mobileNo']);
      case IDetailsService.submitCustomerDetailIdentifier:
        return _detailsService.submitCustomerDetails(
            requestData['data'], requestData['userType']);
      case ICustomerDetailsService.customerDetailIdentifier:
        return _customerDetailsService.getCustomerDetails(
          requestData['id'],
        );
      case ICustomerDetailsService.updateCustomerDetails:
        return _customerDetailsService.saveCustomerDetails(
            requestData['data'], requestData['userType']);


      case IEnrollmentService.enrollmentIdentifier:
        return _enrollmentService.getCustomerDetails(requestData['customerId'],
            requestData['token'], requestData['userType']);
      case IAgentDetailsService.detailIdentifier:
        return _agentDetailsService.getAgentDetail(
          requestData['agentId'],
        );

      case IAgentDetailsService.submitAgentDetailIdentifier:
        return _agentDetailsService.submitAgentDetails(requestData);
      case IWelcomeBackService.getAgentDetailIdentifier:
        return _welcomeBackService.getAgentDetails(requestData['agentId']);

      case IWelcomeBackService.agentLoginIdentifier:
        return _welcomeBackService.loginAgent(requestData);

      case IWelcomeBackService.customerLoginIdentifier:
        return _welcomeBackService.loginCustomer(requestData);
      case ISignupService.getCustomerDetailByNidaMobileAndIdentifier:
        return _signupService.getCustomerDetail(requestData['nidaNo'], requestData['mobileNo']);
      case ISignupService.agentDetailIdentifier:
        return _signupService.getAgentDetails(
            requestData);
      case ISignupService.getCustomerDetailByMobileNumberIdentifier:
        return _signupService.getCustomerDetailByMobileNo(requestData['mobileNo']);
      case IPreferencesService.preferencesIdentifier:
        return _preferencesService.setPreferences(requestData['customerId'],requestData['lang'] );
      case ISignupService.getTelcoListIdentifier:
        return _signupService.getPaymentMode();
      default:
        throw UnimplementedError();
    }
  }
}
