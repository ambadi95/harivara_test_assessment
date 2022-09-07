import 'package:location/location.dart';
import 'package:task_manager/base_classes/base_data_provider.dart';
import 'package:task_manager/task.dart';
import 'package:task_manager/task_manager_impl.dart';
import 'package:shared_data_models/agent_nearby/agents_near_by_response/agents_near_by_response.dart';
import '../agent_nearby_module.dart';
import '../service/agents_nearby_service.dart';
import 'agent_nearby_viewmodel.dart';
import 'package:shared_data_models/agent_nearby/agents_near_by_list/agents_near_by_list.dart';

class AgentNearbyUseCase extends BaseDataProvider {
  final AgentNearbyViewModel _agentNearbyViewModel;
  AgentNearbyUseCase(this._agentNearbyViewModel, TaskManager taskManager)
      : super(taskManager);

  Future<String> hasLocationPermission() async {
    var isServiceEnabled = await _agentNearbyViewModel.isServiceEnabled();
    if (!isServiceEnabled) {
      return 'location-permission';
    }
    var isPermissionGranted = await _agentNearbyViewModel.isPermissionGranted();
    if (!isPermissionGranted) {
      return 'location-permission';
    }
    return '';
  }

  Future<String> hasValidLocation() async {
    var locationError = await _agentNearbyViewModel.hasValidLocation();
    return locationError;
  }

  Future<LocationData> getCurrentLocation() async {
    var locationData = await _agentNearbyViewModel.getCurrentLocation();
    return locationData;
  }

  double calculateDistance(
      double currentLat, double currentLong, double lat, double long) {
    var distance = _agentNearbyViewModel.calculateDistance(
        currentLat, currentLong, lat, long);
    return distance;
  }

  Future<AgentsNearByList?> agentsNearBy(
      String genericSearchValue, Function(String) onErrorCallback) async {
    return await executeApiRequest<AgentsNearByList?>(
        taskType: TaskType.DATA_OPERATION,
        taskSubType: TaskSubType.REST,
        moduleIdentifier: AgentNearByModule.moduleIdentifier,
        requestData: {
          'genericSearchValue': genericSearchValue
          //pass token
        },
        serviceIdentifier: IAgentsNearByService.agentsIdentifier,
        onError: onErrorCallback,
        modelBuilderCallback: (responseData) {
          final data = responseData;
          AgentsNearByList agentsNearByList = AgentsNearByList.fromMap(data);
          return AgentsNearByList.fromMap(data);
        });
  }
}
