import 'package:core/retrievers/app_info_retriever.dart';
import 'package:network_manager/auth/auth_manager.dart';
import 'package:network_manager/auth/common.dart';
import 'package:network_manager/auth/user_manager.dart';
import 'package:network_manager/model/requests/graph_ql/graphql_get_request.dart';
import 'package:network_manager/shared_services/common/get_wallet_id.dart';
import 'package:network_manager/shared_services/get_cards_service.dart';
import 'package:network_manager/queries/get_wallet_query.dart';

abstract class IGetWalletService {
  // TODO: implement use of IGetCardsService
  static const getWalletsApiIdentifier = 'getWallet';

  Future<GraphQLRequest> get getUsersWalletRequest;
}

class GetWalletService implements IGetWalletService {
  final IAuthManager _authManager;
  final AppInfoRetriever _appInfoRetriever;
  final IUserManager _userManager;

  GetWalletService(
    this._authManager,
    this._appInfoRetriever,
    this._userManager,
  );

  @override
  Future<GraphQLRequest> get getUsersWalletRequest async {
    String walletId;

    if (newLoginJourney) {
      walletId = await _userManager.getWalletId() ?? '';
    } else {
      final accessToken = await _authManager.getAccessToken();
      final appInfo = await _appInfoRetriever.getAppInfo;
      walletId = getWalletId(accessToken, appInfo);
    }

    final result = _getWalletsQuery(walletId);
    return GraphQLRequest(
      result,
      // '111' will return 1 card. '100' will return multiple cards '999' will return no cards. We also need correct Bearer token in static_auth.json
      GraphQlRequestType.query,
      showBusy: false,
      name: IGetCardsService.getCardsApiIdentifier,
    );
  }

  String _getWalletsQuery(String walletIdArg) => getWalletQuery(walletIdArg);
}
