import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:network_manager/auth/user_manager.dart';
import 'package:network_manager/model/requests/graph_ql/graphql_get_request.dart';
import 'package:network_manager/shared_services/get_cards_service.dart';
import 'package:shared_data_models/card_wallet/card_wallet.dart';
import '../raw_json_files/raw_json_reader.dart';

class MockUserManager extends Mock implements IUserManager {}

void main() {
  late GetCardsService getCardsService;
  late IUserManager userManager;

  setUp(() {
    userManager = MockUserManager();
    getCardsService = GetCardsService(userManager);

    when(() => userManager.getWalletId())
        .thenAnswer((invocation) async => '123');
  });

  group('getUsersCardsRequest', () {
    test('should return valid GQL Request', () async {
      //Act
      final result = await getCardsService.getUsersCardsRequest;
      //Assert
      expect(result, isA<GraphQLRequest>());
      expect(result.type == GraphQlRequestType.query, true);
      expect(
        result.name == IGetCardsService.getCardsApiIdentifier,
        true,
      );
    });
  });

  group('returnCardWalletList', () {
    test('should return null in the response', () {
      //Arrange
      const requstData = {
        'getWallet': {'cardDetails': null}
      };
      //Act
      final result = IGetCardsService.returnCardWalletList(requstData);
      //Assert
      expect(result, null);
    });

    test('should return some record in the response', () {
      //Arrange
      final rawResponse = rawJsonToMap('get_wallet_response.json');
      //Act
      final result = IGetCardsService.returnCardWalletList(rawResponse);
      //Assert
      expect(result, isA<List<CardWallet>>());
    });
  });
}
