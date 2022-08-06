import 'package:splash/splash/view_model/splash_viewmodel.dart';
import 'package:task_manager/base_classes/base_data_provider.dart';
import 'package:task_manager/task_manager_impl.dart';

class SplashUseCase extends BaseDataProvider {
  final SplashViewModel _splashViewModel;

  SplashUseCase(this._splashViewModel, TaskManager taskManager)
      : super(taskManager);
}
