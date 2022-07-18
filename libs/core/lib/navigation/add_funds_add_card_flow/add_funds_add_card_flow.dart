import 'package:shared_data_models/card_wallet/card_wallet.dart';

import 'add_funds_add_card_flow_navigation.dart';
import 'package:shared_data_models/source_screen/source_screen.dart';

abstract class IAddCardAddFundsFlow {
  Future<void> startFlow({
    required Future<List<CardWallet>?> Function() getCardsCallback,
    required SourceScreen screenToPopUntil,
    Future<void> Function()? overrideNavToAddFundsIfCardsAvailable,
  });
}

class AddCardAddFundsFlow implements IAddCardAddFundsFlow {
  final AddFundsAddCardFlowNavigation _navigationHandler;

  AddCardAddFundsFlow(this._navigationHandler);

  @override
  Future<void> startFlow({
    required Future<List<CardWallet>?> Function() getCardsCallback,
    required SourceScreen screenToPopUntil,
    Future<void> Function()? overrideNavToAddFundsIfCardsAvailable,
  }) async {
    final usersCards = await getCardsCallback();
    if (_cardsAreAvailable(usersCards)) {
      if (overrideNavToAddFundsIfCardsAvailable != null) {
        await overrideNavToAddFundsIfCardsAvailable.call();
      } else {
        await _navigationHandler.navigateToAddFunds(
          usersCards!,
          screenToPopUntil,
        );
      }
    } else {
      final newCard =
          await _navigationHandler.navigateAddCard(screenToPopUntil);
      if (newCard != null) {
        await _navigationHandler.navigateToAddFunds(
          [newCard],
          screenToPopUntil,
        );
      }
    }
  }

  bool _cardsAreAvailable(List<CardWallet>? usersCards) => usersCards != null;
}
