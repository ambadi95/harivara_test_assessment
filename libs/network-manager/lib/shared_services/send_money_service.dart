import 'package:network_manager/model/requests/graph_ql/graphql_get_request.dart';
import 'package:network_manager/queries/send_money_query.dart';

abstract class ISendMoneyService {
  static const sendMoneyApiIdentifier = 'sendMoney';

  Future<GraphQLRequest> sendMoneyRequest(
    Map<String, dynamic> requestData,
  );
}

class SendMoneyService implements ISendMoneyService {
  @override
  Future<GraphQLRequest> sendMoneyRequest(
    Map<String, dynamic> requestData,
  ) async {
    final String paymentInfoQuery = sendMoneyQuery;

    return GraphQLRequest(
      paymentInfoQuery,
      GraphQlRequestType.mutate,
      showBusy: false,
      name: ISendMoneyService.sendMoneyApiIdentifier,
      variables: requestData,
    );
  }
}
