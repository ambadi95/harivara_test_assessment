import 'package:task_manager/task_manager.dart';
import 'package:welcome/sub_features/details/service/details_service.dart';
import 'package:welcome/sub_features/enrollment_success/service/enrollment_service.dart';

import '../sub_features/agent_details/service/agent_details_service.dart';
import '../sub_features/signup/service/signup_service.dart';
import '../sub_features/welcome_back/service/welcome_back_service.dart';

class SignupApiResolver extends TaskResolver {
  final ISignupService _signupService;
  final IDetailsService _detailsService;
  final IEnrollmentService _enrollmentService;
  final IAgentDetailsService _agentDetailsService;
  final IWelcomeBackService _welcomeBackService;

  SignupApiResolver(this._signupService, this._detailsService,
      this._enrollmentService, this._agentDetailsService,
      this._welcomeBackService);

  @override
  Future execute(String identifier, Map<String, dynamic> requestData) {
    switch (identifier) {
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
          customerMobileNumber: requestData['mobileNo'] as String, token: requestData['token']);
      case IDetailsService.regionIdentifier:
        return _detailsService.getRegion();
      case IDetailsService.districtIdentifier:
        return _detailsService.getDistrict(requestData['regionId']);
      case IDetailsService.submitCustomerDetailIdentifier:
        return _detailsService.submitCustomerDetails(requestData);
      case IEnrollmentService.enrollmentIdentifier:
        return _enrollmentService.getCustomerDetails(
            requestData['customerId'], requestData['token']);
      case IAgentDetailsService.detailIdentifier:
        return _agentDetailsService.getAgentDetail(requestData['agentId']);
      case IAgentDetailsService.submitAgentDetailIdentifier:
        return _agentDetailsService.submitAgentDetails(requestData);
      case IWelcomeBackService.getAgentDetailIdentifier:
        return _welcomeBackService.getAgentDetails(
            requestData['agentId']
        );
      case IWelcomeBackService.agentLoginIdentifier:
        return _welcomeBackService.loginAgent(
            requestData
        );
      default:
        throw UnimplementedError();
    }
  }
}
