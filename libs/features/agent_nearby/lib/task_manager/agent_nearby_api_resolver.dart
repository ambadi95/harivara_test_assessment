import 'package:task_manager/task_manager.dart';

import '../service/agents_nearby_service.dart';

class AgentsNearByApiResolver extends TaskResolver {
  final IAgentsNearByService _agentsNearByService;

  AgentsNearByApiResolver(this._agentsNearByService);

  @override
  Future execute(String identifier, Map<String, dynamic> requestData) {
    switch (identifier) {
      case IAgentsNearByService.agentsIdentifier:
        return _agentsNearByService
            .getAgentsNearBy(requestData['genericSearchValue']);
      default:
        throw UnimplementedError();
    }
  }
}
