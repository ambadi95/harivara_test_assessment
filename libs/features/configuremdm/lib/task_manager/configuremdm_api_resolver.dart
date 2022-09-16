import 'package:task_manager/task_manager.dart';

import '../service/configure_mdm_service.dart';


class ConfigureMdmApiResolver extends TaskResolver {

  final IConfigureMdmService _iConfigureMdmService;

  ConfigureMdmApiResolver(this._iConfigureMdmService);

  @override
  Future execute(String identifier, Map<String, dynamic> requestData) {
    switch (identifier) {
      case IConfigureMdmService.mdmRegistrationIdentifier:
        return _iConfigureMdmService.mdmRegistration(requestData['customerId'],requestData['imei']);
      case IConfigureMdmService.mdmStatusUpdateIdentifier:
        return _iConfigureMdmService.mdmStatusUpdate(requestData['customerId'],requestData['imei']);
      default:
        throw UnimplementedError();
    }
  }
}

