import 'package:network_manager/auth/auth_manager.dart';
import 'package:task_manager/base_classes/base_data_provider.dart';
import 'package:task_manager/task.dart';
import 'package:task_manager/task_manager_impl.dart';
import 'package:shared_data_models/detail_detail/device_details.dart';
import '../../../device_option_module.dart';
import 'package:shared_data_models/customer_select_device/customer_select_device_response/customer_select_device_response.dart';
import 'package:shared_data_models/device_option/detail_detail_response/detail_detail_response.dart';

class DeviceLoanCreationUseCase extends BaseDataProvider {
  DeviceLoanCreationUseCase(TaskManager taskManager, this._authManager)
      : super(taskManager);
  final IAuthManager _authManager;


}
