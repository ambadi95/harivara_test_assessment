import 'package:network_manager/model/requests/graph_ql/graphql_get_request.dart';
import 'package:network_manager/queries/fav_card_query.dart';

abstract class IFavCardService {
  static const favCardsApiIdentifier = 'markAsFavourite';
  static const favCardApiCardIdKey = 'cardId';
  static const favCardApiWalletIdKey = 'walletId';

  GraphQLRequest favCard(Map<String, dynamic> cardWallet);
}

class FavCardService implements IFavCardService {
  String _favCardsQuery(int walletId, String cardId) =>
      favCardQuery(walletId, cardId);

  @override
  GraphQLRequest favCard(Map<String, dynamic> cardWallet) {
    return GraphQLRequest(
      _favCardsQuery(
        cardWallet[IFavCardService.favCardApiCardIdKey],
        cardWallet[IFavCardService.favCardApiWalletIdKey],
      ),
      GraphQlRequestType.mutate,
      name: IFavCardService.favCardsApiIdentifier,
      showBusy: false,
    );
  }
}
