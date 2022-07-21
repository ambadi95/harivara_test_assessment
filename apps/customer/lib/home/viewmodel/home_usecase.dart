
import 'package:task_manager/base_classes/base_data_provider.dart';
import 'package:task_manager/task_manager_impl.dart';

import 'home_view_model.dart';

class CustomerHomeUserCase extends BaseDataProvider{
  final CustomerHomeViewModel customHomeViewModel;
  CustomerHomeUserCase(this.customHomeViewModel ,TaskManager taskManager) : super(taskManager);

}