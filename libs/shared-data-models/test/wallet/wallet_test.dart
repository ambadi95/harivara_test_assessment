import 'package:flutter_test/flutter_test.dart';
import 'package:shared_data_models/amount/amount.dart';
import 'package:shared_data_models/wallet/wallet.dart';
import '../raw_json_files/raw_json_reader.dart';
import 'package:shared_data_models/card_wallet/card_wallet.dart';

void main() {
  group('fromJson()', () {
    test('should return Wallet with cards', () async {
      // Arrange
      final json = rawJsonToMap('wallet.json');
      // Act
      final result = Wallet.fromJson(json);
      // Assert
      expect(result.balance, isA<Amount>());
      expect(result.cards, isA<List<CardWallet>>());
      expect(result.walletId, json['walletId']);
      expect(result.limit, json['limit']);
    });

    test('should return Wallet with null cards', () async {
      // Arrange
      final json = rawJsonToMap('wallet_no_cards.json');
      // Act
      final result = Wallet.fromJson(json);
      // Assert
      expect(result.balance, isA<Amount>());
      expect(result.cards, null);
      expect(result.walletId, json['walletId']);
      expect(result.limit, json['limit']);
    });
  });
}
