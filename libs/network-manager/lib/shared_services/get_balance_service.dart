import 'package:network_manager/auth/user_manager.dart';
import 'package:network_manager/model/requests/graph_ql/graphql_get_request.dart';
import 'package:network_manager/queries/get_wallet_balance_query.dart';

abstract class IGetWalletBalanceService {
  static const getWalletBalanceApiIdentifier = 'getWalletBalance';

  Future<GraphQLRequest> get getUserWalletBalanceRequest;
}

class GetWalletBalanceService implements IGetWalletBalanceService {
  final IUserManager _userManager;

  GetWalletBalanceService(
    this._userManager,
  );

  @override
  Future<GraphQLRequest> get getUserWalletBalanceRequest async {
    String walletId = await _userManager.getWalletId() ?? '';

    final result = _getWalletBalanceQuery(walletId);
    return GraphQLRequest(
      result,
      GraphQlRequestType.query,
      showBusy: false,
      name: IGetWalletBalanceService.getWalletBalanceApiIdentifier,
    );
  }

  String _getWalletBalanceQuery(String walletIdArg) =>
      getWalletBalanceQuery(walletIdArg);
}
