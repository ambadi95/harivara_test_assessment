import 'package:task_manager/task_manager.dart';

import '../service/term_condition_service.dart';

class TermConditionApiResolver extends TaskResolver {
  final ITermConditionService _termConditionService;

  TermConditionApiResolver(this._termConditionService);

  @override
  Future execute(String identifier, Map<String, dynamic> requestData) {
    switch (identifier) {
      case ITermConditionService.SaveConsentByAgentIdentifier:
        return _termConditionService.saveConsentByAgent(
          requestData,
        );
      case ITermConditionService.SaveConsentByCustomerIdentifier:
        return _termConditionService.saveConsentByCustomer(
          requestData,
        );
      default:
        throw UnimplementedError();
    }
  }
}
