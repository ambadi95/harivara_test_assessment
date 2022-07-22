import 'package:core/ioc/di_container.dart';
import 'package:core/navigation/navigation_manager.dart';
import 'package:crayon_payment_customer/home/viewmodel/home_coordinator.dart';
import 'package:crayon_payment_customer/home/viewmodel/home_usecase.dart';
import 'package:crayon_payment_customer/home/viewmodel/home_view_model.dart';
import 'package:task_manager/task_manager_impl.dart';

import 'navigation_handler/home_navigation_handler.dart';




class CustomerHomeModule {
  static const moduleIdentifier = 'customerhomemodule';

  static void registerDependencies() {
    DIContainer.container.registerFactory<CustomerHomeCoordinator>(
      (container) => CustomerHomeCoordinator(
          CustomerHomeNavigationHandler(container.resolve<NavigationManager>()),
          CustomerHomeUserCase(
            CustomerHomeViewModel(),
            container.resolve<TaskManager>(),
          )),
    );


  }
}
