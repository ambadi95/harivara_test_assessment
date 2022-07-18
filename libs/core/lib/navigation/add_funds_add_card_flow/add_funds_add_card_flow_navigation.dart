import 'package:core/model/cards_state.dart';
import 'package:core/navigation/navigation_details.dart';
import 'package:core/navigation/navigation_manager.dart';
import 'package:core/navigation/navigation_type.dart';
import 'package:shared_data_models/card_wallet/card_wallet.dart';
import 'package:shared_data_models/add_funds/add_funds_screen_args.dart';
import 'package:shared_data_models/source_screen/source_screen.dart';

class AddFundsAddCardFlowNavigation {
  final NavigationManager _navigationManager;

  AddFundsAddCardFlowNavigation(this._navigationManager);

  Future<CardWallet?> navigateAddCard(SourceScreen screenToPopUntil) async {
    List<CardWallet>? result;
    await _navigationManager.navigateWithNavDetails(
      NavigationDetails<CardsState, List<CardWallet>>(
        pushPath: 'addCardModule/addCardScreen',
        pushType: NavigationType.push(),
        popType: NavigationType.popUntil(),
        popToPath: screenToPopUntil.path,
        pushArguments: CardsState.noCards(),
        onPopCallback: (cardWallets) {
          result = cardWallets;
        },
      ),
    );
    if (result != null) {
      return result![0];
    }
    return null;
  }

  Future<void> navigateToAddFunds(
    List<CardWallet> cards,
    SourceScreen screenToPopUntil,
  ) async {
    var args = AddFundsScreenArgs(
      usersCards: cards,
      sourceScreen: screenToPopUntil,
    );
    await _navigationManager.navigateTo(
      'addFundsModule/addFundsScreen',
      NavigationType.push(),
      arguments: args,
    );
  }
}
