import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'card_brand.freezed.dart';

@freezed
class CardBrand with _$CardBrand {
  const CardBrand._();

  factory CardBrand.fromString(String rawString) {
    switch (rawString.toLowerCase()) {
      case 'visa':
        return const CardBrand.visa();
      case 'mastercard':
        return const CardBrand.mastercard();
      case 'diners_club_mada':
        return const CardBrand.dinersInternational();
      case 'american_express':
        return const CardBrand.amex();
      case 'china_unionpay':
        return const CardBrand.chinaUnionPay();
      case 'american_express_mada':
        return const CardBrand.mada();
      default:
        throw UnimplementedError('$rawString not supported');
    }
  }

  const factory CardBrand.visa() = Visa;

  const factory CardBrand.mastercard() = Mastercard;

  const factory CardBrand.discover() = Discover;

  const factory CardBrand.amex() = AMEX;

  const factory CardBrand.dinersUSA() = DinersUSA;

  const factory CardBrand.dinersInternational() = DinersInternational;

  const factory CardBrand.chinaUnionPay() = ChinaUnionPay;

  const factory CardBrand.madaVisa() = MadaVisa;

  const factory CardBrand.madaMasterCard() = MadaMasterCard;

  const factory CardBrand.mada() = Mada;

  const factory CardBrand.unknown() = Unknown;

  const factory CardBrand.processing() = Processing;

  @override
  String toString() {
    return maybeWhen(
      visa: () => 'VISA',
      mastercard: () => 'MASTERCARD',
      discover: () => 'DISCOVER',
      amex: () => 'AMERICAN_EXPRESS',
      dinersUSA: () => 'DINERS_CLUB',
      dinersInternational: () => 'DINERS_CLUB_MADA',
      chinaUnionPay: () => 'CHINA_UNIONPAY',
      madaVisa: () => 'VISA_MADA',
      madaMasterCard: () => 'MASTERCARD_MADA',
      mada: () => 'AMERICAN_EXPRESS_MADA',
      processing: () => 'processing',
      orElse: () => 'OTHER',
    );
  }

  AssetImage get imageAssetPath {
    final assetPath = maybeWhen(
      amex: () => 'amex.png',
      mastercard: () => 'mastercard.png',
      visa: () => 'visa.png',
      dinersInternational: () => 'diners.png',
      dinersUSA: () => 'diners.png',
      madaMasterCard: () => 'mada_mastercard.png',
      madaVisa: () => 'mada_visa.png',
      mada: () => 'mada.png',
      chinaUnionPay: () => 'union_pay.png',
      orElse: () => '',
    );
    return AssetImage(
      'packages/shared_data_models/assets/card_images/$assetPath',
    );
  }
}
