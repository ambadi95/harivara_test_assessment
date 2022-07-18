import 'package:core/navigation/navigation_manager.dart';
import 'package:task_manager/module_resolver.dart';
import 'package:widget_library/routes/widgets_route_manager.dart';
import 'package:widget_library/task_manager/widgets_module_resolver.dart';

// import 'task_manager/widgets_module_resolver.dart';

abstract class WidgetsModule {
  void registerDependencies();
}

class WidgetsModuleImpl extends WidgetsModule {
  final NavigationManager _navigationManager;

  WidgetsModuleImpl(this._navigationManager);

  /// Registers all of the dependencies for the Widget Module's dependency
  /// injection system.
  @override
  void registerDependencies() {
    _navigationManager.registerRouteManager(
      'src',
      WidgetsRouteManager(),
    );
    ModuleResolver.registerResolver(
      WidgetsModuleResolver.moduleIdentifier,
      WidgetsModuleResolver(),
    );
  }
}
