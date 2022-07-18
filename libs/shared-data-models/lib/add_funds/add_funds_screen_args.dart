import 'package:shared_data_models/card_wallet/card_wallet.dart';
import 'package:shared_data_models/source_screen/source_screen.dart';

class AddFundsScreenArgs {
  final List<CardWallet> usersCards;
  final SourceScreen? sourceScreen;
  final String? initialAmount;

  AddFundsScreenArgs({
    required this.usersCards,
    this.sourceScreen,
    this.initialAmount,
  });
}
