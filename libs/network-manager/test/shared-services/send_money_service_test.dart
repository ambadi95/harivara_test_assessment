import 'package:flutter_test/flutter_test.dart';
import 'package:network_manager/model/requests/graph_ql/graphql_get_request.dart';
import 'package:network_manager/shared_services/send_money_service.dart';

void main() {
  late SendMoneyService sendMoneyService;

  setUp(() {
    sendMoneyService = SendMoneyService();
  });

  group('sendMoneyRequest', () {
    test('should return valid GQL request', () async {
      //Arrange
      const requestData = {'sample': 1};
      //Act
      final result = await sendMoneyService.sendMoneyRequest(requestData);

      //Assert
      expect(result, isA<GraphQLRequest>());
      expect(result.type == GraphQlRequestType.mutate, true);
      expect(
        result.name == ISendMoneyService.sendMoneyApiIdentifier,
        true,
      );
    });
  });
}
