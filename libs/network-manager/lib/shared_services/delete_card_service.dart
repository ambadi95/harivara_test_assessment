import 'package:network_manager/model/requests/graph_ql/graphql_get_request.dart';
import 'package:network_manager/queries/delete_card_query.dart';

abstract class IDeleteCardService {
  static const deleteCardsApiIdentifier = 'deleteCardFromWallet';
  static const deleteCardApiCardIdKey = 'cardId';
  static const deleteCardApiWalletIdKey = 'walletId';

  GraphQLRequest deleteCard(Map<String, dynamic> cardWallet);
}

class DeleteCardService implements IDeleteCardService {
  String _deleteCardsQuery(int walletId, String cardId) =>
      deleteCardQuery(walletId, cardId);

  @override
  GraphQLRequest deleteCard(Map<String, dynamic> cardWallet) {
    return GraphQLRequest(
      _deleteCardsQuery(
        cardWallet[IDeleteCardService.deleteCardApiWalletIdKey],
        cardWallet[IDeleteCardService.deleteCardApiCardIdKey],
      ),
      GraphQlRequestType.mutate,
      name: IDeleteCardService.deleteCardsApiIdentifier,
      showBusy: false,
    );
  }
}
