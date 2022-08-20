import 'package:core/logging/logger.dart';
import 'package:network_manager/auth/auth_manager.dart';
import 'package:shared_data_models/agent_onboard/agent_details/response/agent_details_response.dart';
import 'package:task_manager/base_classes/base_data_provider.dart';
import 'package:task_manager/task.dart';
import 'package:task_manager/task_manager_impl.dart';
import 'package:shared_data_models/welcome/signin/response/customer_sign_in_response.dart';

import 'downpayment_viewmodel.dart';

class DownPaymentUseCase extends BaseDataProvider {
  final DownPaymentViewModel _downpaymentviewmodel;


  DownPaymentUseCase(this._downpaymentviewmodel, TaskManager taskManager)
      : super(taskManager);


}
