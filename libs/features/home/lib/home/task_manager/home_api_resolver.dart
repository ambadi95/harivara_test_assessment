import 'package:task_manager/task_manager.dart';
import 'package:welcome/sub_features/details/service/details_service.dart';

import '../service/home_service.dart';

class HomeApiResolver extends TaskResolver {
  final IHomeService _homeService;

  HomeApiResolver(this._homeService);

  @override
  Future execute(String identifier, Map<String, dynamic> requestData) {
    switch (identifier) {
      case IHomeService.customerCountIdentifier:
        return _homeService.getCustomerCount(
            requestData['token'], requestData['agentId']);
      default:
        throw UnimplementedError();
    }
  }
}
