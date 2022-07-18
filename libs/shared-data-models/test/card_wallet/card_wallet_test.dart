import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shared_data_models/card_wallet/card_brand.dart';
import 'package:shared_data_models/card_wallet/card_type.dart';
import 'package:shared_data_models/card_wallet/card_wallet.dart';

import '../raw_json_files/raw_json_reader.dart';

class MockCardWallet extends Mock implements CardWallet {}

void main() {
  group('[CardWallet] - fromJson() -', () {
    test('should return valid model', () async {
      // Arrange
      final json = rawJsonToMap('card_wallet.json');
      // Act
      final result = CardWallet.fromJson(json);
      // Assert
      expect(result, isA<CardWallet>());
      expect(result.walletId, json['walletId']);
      expect(result.cardId, json['cardId']);
      expect(result.brandName, isA<CardBrand>());
      expect(result.cardType, isA<CardType>());
      expect(result.cardNickName, json['nickName']);
      expect(result.cardImageUrl, json['cardImageUrl']);
      expect(result.expiryMonth, json['expiryMonth']);
      expect(result.expiryYear, json['expiryYear']);
      expect(result.isFavourite, json['favourite']);
      expect(result.cvs, json['cvs']);
    });
  });

  group('[CardWallet] - toJson() -', () {
    test('should return valid json', () async {
      // Arrange
      final json = rawJsonToMap('card_wallet.json');
      // Act
      final result = CardWallet.fromJson(json);
      final jsonResult = result.toJson();
      // Assert
      expect(jsonResult['brand'], json['brand']);
      expect(jsonResult['cardType'], json['debit']);
      expect(jsonResult['cardNumber'], json['cardNumber']);
      expect(jsonResult['nickName'], json['nickName']);
      expect(jsonResult['expiryMonth'], json['expiryMonth']);
      expect(jsonResult['expiryYear'], json['expiryYear']);
      expect(jsonResult['favourite'], json['favourite']);
      expect(jsonResult['cvs'], json['cvs']);
    });
  });

  group('[CardWallet] - methods() -', () {
    late CardWallet cardWallet;

    final brandName = CardBrand.amex();
    final cardId = 'cardId1234';
    final cardNickName = 'John Doe';
    final cardType = CardType.credit();
    final expiryMonth = 4;
    final expiryYear = 2022;
    final isFavourite = true;
    final walletId = 123456;
    final cardNumber = '24321';
    final isNew = true;
    final String cvs = '904';
    final String cardImageUrl = 'this_url';

    List<Object> walletProps = [
      walletId,
      brandName,
      cardNickName,
      cardImageUrl,
      expiryMonth,
      expiryYear,
      isFavourite,
      cvs
    ];

    setUp(() {
      cardWallet = CardWallet(
        brandName,
        cardId,
        cardNickName,
        cardType,
        expiryMonth,
        expiryYear,
        isFavourite,
        walletId,
        cvs,
        cardNumber,
        isNew,
      );
    });
    group('copyWith() -', () {
      test('should change brandName', () async {
        // Act
        cardWallet = cardWallet.copyWith(
          brandName: CardBrand.mada(),
        );
        // Assert
        expect(cardWallet.brandName, isA<Mada>());
      });

      test('should change expiryMonth', () async {
        // Act
        cardWallet = cardWallet.copyWith(
          expiryMonth: 6,
        );
        // Assert
        expect(cardWallet.expiryMonth, 6);
      });
    });

    group('get props -', () {
      test('should return correct values', () async {
        // Arrange
        cardWallet = cardWallet.copyWith(cardImageUrl: cardImageUrl);
        // Act
        List<Object?> props = cardWallet.props;
        // Assert
        for (int i = 0; i < props.length; i++) {
          expect(props.elementAt(i), walletProps.elementAt(i));
        }
      });
    });

    group('utils -', () {
      test('should get correct date format', () async {
        // Act
        final String date = cardWallet.formattedExpiryDate();
        // Assert
        expect(date, '04/22');
      });

      test('should return last 4 digits', () async {
        // Act
        final String last4Digits = cardWallet.last4Digits;
        // Assert
        expect(last4Digits, '4321');
      });

      test('should get NetworkImage', () async {
        // Arrange
        cardWallet = cardWallet.copyWith(cardImageUrl: cardImageUrl);
        // Act
        final imageProvider = cardWallet.image;
        // Assert
        expect(imageProvider, isA<NetworkImage>());
      });

      test('should get imageAssetPath from brandName', () async {
        // Act
        final AssetImage assetImage = cardWallet.image as AssetImage;
        // Assert
        expect(
          assetImage.assetName,
          cardWallet.brandName.imageAssetPath.assetName,
        );
      });
    });
  });
}
