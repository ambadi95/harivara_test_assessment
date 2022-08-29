import 'package:agent_nearby/service/agents_nearby_service.dart';
import 'package:agent_nearby/task_manager/agent_nearby_api_resolver.dart';
import 'package:agent_nearby/task_manager/agents_nearby_module_resolver.dart';
import 'package:agent_nearby/viewmodel/agent_nearby_coordinator.dart';
import 'package:agent_nearby/viewmodel/agent_nearby_viewmodel.dart';
import 'package:core/ioc/di_container.dart';
import 'package:core/navigation/navigation_manager.dart';
import 'package:location/location.dart';
import 'package:task_manager/module_resolver.dart';
import 'package:task_manager/task_manager_impl.dart';
import 'navigation_handler/agent_nearby_navigation_handler.dart';
import 'viewmodel/agent_nearby_usecase.dart';
import 'package:location_platform_interface/location_platform_interface.dart';

class AgentNearByModule {
  static const moduleIdentifier = 'agentNearbyModule';

  static void registerDependencies() {
    ModuleResolver.registerResolver(
      moduleIdentifier,
      AgentNearByModuleResolver(AgentsNearByApiResolver(AgentsNearByService())),
    );

    DIContainer.container.registerFactory<AgentNearbyCoordinator>(
      (container) => AgentNearbyCoordinator(
        AgentNearbyNavigationHandler(container.resolve<NavigationManager>()),
        AgentNearbyUseCase(
          AgentNearbyViewModel(),
          container.resolve<TaskManager>(),
        ),
      ),
    );
  }
}
