import 'package:flutter_test/flutter_test.dart';
import 'package:shared_data_models/card_wallet/card_brand.dart';

void main() {
  setUp(() {});

  group('[CardBrand] - fromString() -', () {
    test('should return visa', () async {
      // Arrange
      const cardTypeString = 'VISA';
      // Act
      final type = CardBrand.fromString(cardTypeString);
      // Assert
      expect(type, isA<Visa>());
    });

    test('should return mastercard', () async {
      // Arrange
      const cardTypeString = 'MASTERCARD';
      // Act
      final type = CardBrand.fromString(cardTypeString);
      // Assert
      expect(type, isA<Mastercard>());
    });

    test('should return amex', () async {
      // Arrange
      const cardTypeString = 'AMERICAN_EXPRESS';
      // Act
      final type = CardBrand.fromString(cardTypeString);
      // Assert
      expect(type, isA<AMEX>());
    });

    test('should return diners', () async {
      // Arrange
      const cardTypeString = 'DINERS_CLUB_MADA';
      // Act
      final type = CardBrand.fromString(cardTypeString);
      // Assert
      expect(type, isA<DinersInternational>());
    });

    test('should return mada', () async {
      // Arrange
      const cardTypeString = 'AMERICAN_EXPRESS_MADA';
      // Act
      final type = CardBrand.fromString(cardTypeString);
      // Assert
      expect(type, isA<Mada>());
    });

    test('should return unionpay', () async {
      // Arrange
      const cardTypeString = 'CHINA_UNIONPAY';
      // Act
      final type = CardBrand.fromString(cardTypeString);
      // Assert
      expect(type, isA<ChinaUnionPay>());
    });

    test('should throw exception', () async {
      // Arrange
      const cardTypeString = 'unImplementedCardType';
      // Act
      try {
        CardBrand.fromString(cardTypeString);
        throw Exception('fail test');
      } catch (e) {
        expect(e, isA<UnimplementedError>());
      }
      // Assert
    });
  });

  group('[CardBrand] - toString()', () {
    test('should return VISA', () async {
      // Arrange
      const cardType = CardBrand.visa();
      // Act
      final result = cardType.toString();
      // Assert
      expect(result, 'VISA');
    });

    test('should return MASTERCARD', () async {
      // Arrange
      const cardType = CardBrand.mastercard();
      // Act
      final result = cardType.toString();
      // Assert
      expect(result, 'MASTERCARD');
    });

    test('should return DISCOVER', () async {
      // Arrange
      const cardType = CardBrand.discover();
      // Act
      final result = cardType.toString();
      // Assert
      expect(result, 'DISCOVER');
    });

    test('should return AMERICAN_EXPRESS', () async {
      // Arrange
      const cardType = CardBrand.amex();
      // Act
      final result = cardType.toString();
      // Assert
      expect(result, 'AMERICAN_EXPRESS');
    });

    test('should return DINERS_CLUB', () async {
      // Arrange
      const cardType = CardBrand.dinersUSA();
      // Act
      final result = cardType.toString();
      // Assert
      expect(result, 'DINERS_CLUB');
    });

    test('should return DINERS_CLUB_MADA', () async {
      // Arrange
      const cardType = CardBrand.dinersInternational();
      // Act
      final result = cardType.toString();
      // Assert
      expect(result, 'DINERS_CLUB_MADA');
    });

    test('should return CHINA_UNIONPAY', () async {
      // Arrange
      const cardType = CardBrand.chinaUnionPay();
      // Act
      final result = cardType.toString();
      // Assert
      expect(result, 'CHINA_UNIONPAY');
    });

    test('should return VISA_MADA', () async {
      // Arrange
      const cardType = CardBrand.madaVisa();
      // Act
      final result = cardType.toString();
      // Assert
      expect(result, 'VISA_MADA');
    });

    test('should return MASTERCARD_MADA', () async {
      // Arrange
      const cardType = CardBrand.madaMasterCard();
      // Act
      final result = cardType.toString();
      // Assert
      expect(result, 'MASTERCARD_MADA');
    });

    test('should return AMERICAN_EXPRESS_MADA', () async {
      // Arrange
      const cardType = CardBrand.mada();
      // Act
      final result = cardType.toString();
      // Assert
      expect(result, 'AMERICAN_EXPRESS_MADA');
    });

    test('should return processing', () async {
      // Arrange
      const cardType = CardBrand.processing();
      // Act
      final result = cardType.toString();
      // Assert
      expect(result, 'processing');
    });

    test('should return OTHER', () async {
      // Arrange
      const cardType = CardBrand.unknown();
      // Act
      final result = cardType.toString();
      // Assert
      expect(result, 'OTHER');
    });
  });

  group('[CardBrand] - get imageAssetPath -', () {
    String path = 'packages/shared_data_models/assets/card_images/';
    test('should return amex.png', () async {
      // Arrange
      const cardType = CardBrand.amex();
      // Act
      final result = cardType.imageAssetPath;
      // Assert
      expect(result.assetName, '${path}amex.png');
    });

    test('should return mastercard.png', () async {
      // Arrange
      const cardType = CardBrand.mastercard();
      // Act
      final result = cardType.imageAssetPath;
      // Assert
      expect(result.assetName, '${path}mastercard.png');
    });

    test('should return visa.png', () async {
      // Arrange
      const cardType = CardBrand.visa();
      // Act
      final result = cardType.imageAssetPath;
      // Assert
      expect(result.assetName, '${path}visa.png');
    });

    test('should return diners.png [1]', () async {
      // Arrange
      const cardType = CardBrand.dinersInternational();
      // Act
      final result = cardType.imageAssetPath;
      // Assert
      expect(result.assetName, '${path}diners.png');
    });

    test('should return diners.png [2]', () async {
      // Arrange
      const cardType = CardBrand.dinersUSA();
      // Act
      final result = cardType.imageAssetPath;
      // Assert
      expect(result.assetName, '${path}diners.png');
    });

    test('should return mada_mastercard.png', () async {
      // Arrange
      const cardType = CardBrand.madaMasterCard();
      // Act
      final result = cardType.imageAssetPath;
      // Assert
      expect(result.assetName, '${path}mada_mastercard.png');
    });

    test('should return mada_visa.png', () async {
      // Arrange
      const cardType = CardBrand.madaVisa();
      // Act
      final result = cardType.imageAssetPath;
      // Assert
      expect(result.assetName, '${path}mada_visa.png');
    });

    test('should return mada.png', () async {
      // Arrange
      const cardType = CardBrand.mada();
      // Act
      final result = cardType.imageAssetPath;
      // Assert
      expect(result.assetName, '${path}mada.png');
    });

    test('should return union_pay.png', () async {
      // Arrange
      const cardType = CardBrand.chinaUnionPay();
      // Act
      final result = cardType.imageAssetPath;
      // Assert
      expect(result.assetName, '${path}union_pay.png');
    });

    test('should return empty string', () async {
      // Arrange
      const cardType = CardBrand.unknown();
      // Act
      final result = cardType.imageAssetPath;
      // Assert
      expect(result.assetName, '${path}');
    });
  });
}
