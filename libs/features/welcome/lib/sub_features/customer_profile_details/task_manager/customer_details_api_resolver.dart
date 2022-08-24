import 'package:task_manager/task_manager.dart';

import '../service/customer_details_service.dart';

class CustomerDetailsApiResolver extends TaskResolver {
  final ICustomerDetailsService _detailsService;

  CustomerDetailsApiResolver(this._detailsService);

  @override
  Future execute(String identifier, Map<String, dynamic> requestData) {
    switch (identifier) {
      case ICustomerDetailsService.regionIdentifier:
        return _detailsService.getRegion(requestData['userType']);
      case ICustomerDetailsService.districtIdentifier:
        return _detailsService.getDistrict(
            requestData['regionId'], requestData['userType']);
      case ICustomerDetailsService.customerDetailIdentifier:
        return _detailsService.getCustomerDetails(
          requestData['id'],
        );
      case ICustomerDetailsService.submitCustomerDetailIdentifier:
        return _detailsService.submitCustomerDetails(
            requestData['data'], requestData['userType']);
      default:
        throw UnimplementedError();
    }
  }
}
