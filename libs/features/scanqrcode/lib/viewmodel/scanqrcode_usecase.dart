import 'package:core/logging/logger.dart';
import 'package:network_manager/auth/auth_manager.dart';
import 'package:scanqrcode/viewmodel/scanqrcode_viewmodel.dart';
import 'package:shared_data_models/agent_onboard/agent_details/response/agent_details_response.dart';
import 'package:task_manager/base_classes/base_data_provider.dart';
import 'package:task_manager/task.dart';
import 'package:task_manager/task_manager_impl.dart';


class ScanQRCodeUseCase extends BaseDataProvider {
  final ScanQRCodeViewModel _scanQRCodeViewModel;


  ScanQRCodeUseCase(this._scanQRCodeViewModel, TaskManager taskManager)
      : super(taskManager);


  Future<String> getAgentName() async {
    return await getValueFromSecureStorage('agentName', defaultValue: '');
  }
}
