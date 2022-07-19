import 'package:network_manager/auth/user_manager.dart';
import 'package:network_manager/model/requests/graph_ql/graphql_get_request.dart';
import 'package:network_manager/queries/get_wallet_query.dart';

abstract class IGetCardsService {
  static const getCardsApiIdentifier = 'getWallet';

  Future<GraphQLRequest> get getUsersCardsRequest;


}

class GetCardsService implements IGetCardsService {
  final IUserManager _userManager;

  GetCardsService(
    this._userManager,
  );

  @override
  Future<GraphQLRequest> get getUsersCardsRequest async {
    String walletId = await _userManager.getWalletId() ?? '100';
    return GraphQLRequest(
      getWalletQuery(walletId),
      GraphQlRequestType.query,
      name: IGetCardsService.getCardsApiIdentifier,
      showBusy: false,
    );
  }
}
