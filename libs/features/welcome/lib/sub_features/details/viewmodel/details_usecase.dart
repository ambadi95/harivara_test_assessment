
import 'package:task_manager/base_classes/base_data_provider.dart';
import 'package:task_manager/task_manager_impl.dart';

import 'details_view_model.dart';

class DetailsUseCase extends BaseDataProvider{
  final DetailsViewModel detailsViewModel;
  DetailsUseCase(this.detailsViewModel ,TaskManager taskManager) : super(taskManager);

}