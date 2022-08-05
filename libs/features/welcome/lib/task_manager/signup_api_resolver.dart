import 'package:task_manager/task_manager.dart';
import 'package:welcome/sub_features/details/service/details_service.dart';
import 'package:welcome/sub_features/enrollment_success/service/enrollment_service.dart';

import '../sub_features/signup/service/signup_service.dart';

class SignupApiResolver extends TaskResolver {
  final ISignupService _signupService;
  final IDetailsService _detailsService;
  final IEnrollmentService _enrollmentService;

  SignupApiResolver(
      this._signupService, this._detailsService, this._enrollmentService);

  @override
  Future execute(String identifier, Map<String, dynamic> requestData) {
    switch (identifier) {
      case ISignupService.signupIdentifier:
        return _signupService.signup(
          requestData['nindaNumber'] as String,
          requestData['phoneNo'] as String,
        );
      case IDetailsService.regionIdentifier:
        return _detailsService.getRegion();
      case IDetailsService.districtIdentifier:
        return _detailsService.getDistrict(requestData['regionId']);
      case IDetailsService.submitCustomerDetailIdentifier:
        return _detailsService.submitCustomerDetails(requestData);
      case IEnrollmentService.enrollmentIdentifier:
        return _enrollmentService.getCustomerDetails(requestData['customerId']);
      default:
        throw UnimplementedError();
    }
  }
}
