import 'package:network_manager/auth/user_manager.dart';
import 'package:network_manager/model/requests/graph_ql/graphql_get_request.dart';
import 'package:network_manager/queries/get_wallet_query.dart';
import 'package:shared_data_models/card_wallet/card_wallet.dart';

abstract class IGetCardsService {
  static const getCardsApiIdentifier = 'getWallet';

  Future<GraphQLRequest> get getUsersCardsRequest;

  static List<CardWallet>? returnCardWalletList(
    Map<String, dynamic> responseData,
  ) {
    final cardMaps = responseData['getWallet']['cardDetails'];
    List<CardWallet>? allCards;
    if (cardMaps != null) {
      allCards = List<CardWallet>.from(
        cardMaps.map((cardMap) => CardWallet.fromJson(cardMap)),
      );
      if (allCards.isEmpty) {
        allCards = null;
      }
    }
    return allCards;
  }
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
