import 'package:network_manager/auth/user_manager.dart';
import 'package:network_manager/model/requests/request.dart';
import 'package:network_manager/model/requests/standard/standard_request.dart';

abstract class ICustomerProfileService {
  static const getProfileApiIdentifier = 'getProfileApiIdentifier';

  Future<StandardRequest> getProfile();
}

class CustomerProfileService implements ICustomerProfileService {
  final IUserManager _userManager;

  CustomerProfileService(this._userManager);

  @override
  Future<StandardRequest> getProfile() async {
    String? customerId = await _userManager.getUserId();

    var request = StandardRequest();
    request.requestType = RequestType.GET;
    request.endpoint = 'customer/customers/v1.0/customer/$customerId';

    return request;
  }
}
