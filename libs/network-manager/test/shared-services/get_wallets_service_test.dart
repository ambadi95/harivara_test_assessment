import 'package:core/retrievers/app_info_retriever.dart';
import 'package:core/retrievers/data_models/app_info.dart';
import 'package:core/retrievers/data_models/app_type.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:network_manager/auth/auth_manager.dart';
import 'package:network_manager/auth/user_manager.dart';
import 'package:network_manager/model/requests/graph_ql/graphql_get_request.dart';
import 'package:network_manager/shared_services/get_cards_service.dart';
import 'package:network_manager/shared_services/get_wallets_service.dart';
import 'package:network_manager/auth/common.dart';

class MockAuthManager extends Mock implements IAuthManager {}

class MockAppInfoRetriever extends Mock implements AppInfoRetriever {}

class MockUserManager extends Mock implements IUserManager {}

void main() {
  late GetWalletService getWalletService;
  late IAuthManager authManager;
  late AppInfoRetriever appInfoRetriever;
  late IUserManager userManager;

  setUp(() {
    authManager = MockAuthManager();
    appInfoRetriever = MockAppInfoRetriever();
    userManager = MockUserManager();
    getWalletService =
        GetWalletService(authManager, appInfoRetriever, userManager);

    when(() => userManager.getWalletId()).thenAnswer((_) async => '123');
  });

  group('addUserWalletRequest', () {
    test('validate the GQL request for the newLogin', () async {
      //Arrange
      when(() => authManager.getAccessToken())
          .thenAnswer((invocation) async => '123');
      //Act
      final result = await getWalletService.getUsersWalletRequest;
      // Assert
      expect(result, isA<GraphQLRequest>());
      expect(result.type == GraphQlRequestType.query, true);
      expect(
        result.name == IGetCardsService.getCardsApiIdentifier,
        true,
      );
    });

    test('validate the GQL request for the old login', () async {
      //Arrange
      when(() => authManager.getAccessToken())
          .thenAnswer((invocation) async => '123');
      newLoginJourney = false;
      when(() => authManager.getAccessToken())
          .thenAnswer((invocation) async => 't8k');
      when(() => appInfoRetriever.getAppInfo).thenAnswer((invocation) async =>
          AppInfo(appType: AppType.merchant(), appVersion: '1'));
      //Act
      final result = await getWalletService.getUsersWalletRequest;
      // Assert
      expect(result, isA<GraphQLRequest>());
      expect(result.type == GraphQlRequestType.query, true);
      expect(
        result.name == IGetCardsService.getCardsApiIdentifier,
        true,
      );
    });
  });
}
