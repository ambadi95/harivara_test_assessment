import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:shared_data_models/card_wallet/card_type.dart';

import 'card_brand.dart';

class CardWallet extends Equatable {
  final int walletId;
  final CardBrand brandName;
  final CardType cardType;
  final String cardId;
  final String cardNickName;
  final String? cardImageUrl;
  final int expiryMonth;
  final int expiryYear;
  final bool isFavourite;
  final String? cvs;
  final String cardNumber;
  final bool isNew;

  const CardWallet(
    this.brandName,
    this.cardId,
    this.cardNickName,
    this.cardType,
    this.expiryMonth,
    this.expiryYear,
    this.isFavourite,
    this.walletId,
    this.cvs,
    this.cardNumber,
    this.isNew, {
    this.cardImageUrl,
  });

  CardWallet copyWith({
    int? walletId,
    CardBrand? brandName,
    CardType? cardType,
    String? cardId,
    String? cardNickName,
    String? cardImageUrl,
    int? expiryMonth,
    int? expiryYear,
    bool? isFavourite,
    String? cvs,
    String? cardNumber,
    bool? isNew,
  }) {
    return CardWallet(
      brandName ?? this.brandName,
      cardId ?? this.cardId,
      cardNickName ?? this.cardNickName,
      cardType ?? this.cardType,
      expiryMonth ?? this.expiryMonth,
      expiryYear ?? this.expiryYear,
      isFavourite ?? this.isFavourite,
      walletId ?? this.walletId,
      cvs ?? this.cvs,
      cardNumber ?? this.cardNumber,
      isNew ?? this.isNew,
      cardImageUrl: cardImageUrl ?? this.cardImageUrl,
    );
  }

  factory CardWallet.fromJson(Map<String, dynamic> json) => CardWallet(
        CardBrand.fromString(json['brand'] as String),
        json['cardId'] as String,
        json['nickName'] as String,
        CardType.fromString(json['cardType'] as String),
        json['expiryMonth'] as int,
        json['expiryYear'] as int,
        json['favourite'] as bool,
        json['walletId'] as int,
        json['cvs'],
        json['cardNumber'] as String,
        false,
        cardImageUrl: json['cardImageUrl'] as String?,
      );

  Map<String, dynamic> toJson() {
    return {
      'brand': brandName.toString(),
      'nickName': cardNickName,
      'cardNumber': cardNumber,
      'expiryMonth': expiryMonth,
      'expiryYear': expiryYear,
      'favourite': isFavourite,
      'cvs': cvs,
    };
  }

  ImageProvider get image {
    if (cardImageUrl != null && Uri.tryParse(cardImageUrl!) != null) {
      return NetworkImage(cardImageUrl!);
    } else {
      return brandName.imageAssetPath;
    }
  }

  String formattedExpiryDate() {
    String monthString = expiryMonth.toString().padLeft(2, '0');
    String monthYear = expiryYear.toString();
    if (monthYear.length > 2) {
      monthYear = monthYear.substring(2);
    }
    return '$monthString/$monthYear';
  }

  String get last4Digits => cardNumber.substring(cardNumber.length - 4);

  @override
  List<Object?> get props => [
        walletId,
        brandName,
        cardNickName,
        cardImageUrl,
        expiryMonth,
        expiryYear,
        isFavourite,
        cvs,
      ];
}
