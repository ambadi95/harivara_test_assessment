import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:shared_data_models/card_wallet/card_brand.dart';
import 'package:shared_data_models/card_wallet/card_wallet.dart';
import 'package:widget_library/dimensions/crayon_payment_dimensions.dart';

List<Shadow> _textShadows = <Shadow>[
  Shadow(
    offset: Offset(0.0, 2.0),
    blurRadius: 4.0,
    color: Colors.black.withOpacity(0.25),
  ),
];

class CrayonPaymentCardDetailsHolder extends StatelessWidget {
  final String _identifier = 'CrayonPaymentCardDetailsHolder';
  final CardWallet cardDetails;

  CrayonPaymentCardDetailsHolder({required this.cardDetails});

  @override
  Widget build(BuildContext context) {
    final String cardBackgroundPath =
        _getCardBackgroundPath(cardDetails.brandName);

    return Directionality(
      textDirection: TextDirection.ltr,
      child: LayoutBuilder(
        key: Key(_identifier),
        builder: (context, constraints) => Stack(
          children: [
            Container(
              key: Key('${_identifier}_Cover'),
              height: 204,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: Svg(cardBackgroundPath),
                  fit: BoxFit.cover,
                ),
                borderRadius: const BorderRadius.all(
                  Radius.circular(20),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Color(0xFFA5A5A5).withOpacity(0.35),
                    offset: Offset(0, 0),
                    blurRadius: 24,
                    spreadRadius: 0,
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: CrayonPaymentDimensions.mediumMargin,
                left: CrayonPaymentDimensions.mediumMargin,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    key: Key('${_identifier}_NickName'),
                    width: 0.7 * constraints.maxWidth,
                    child: Text(
                      cardDetails.cardNickName.toUpperCase(),
                      style: Theme.of(context).textTheme.headline3!.copyWith(
                            fontFamily: 'OCR-A',
                            fontSize: 20,
                            color: Colors.white,
                            shadows: _textShadows,
                          ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Spacer(),
                  Text(
                    '****   ******   ' + cardDetails.cardNumber,
                    key: Key('${_identifier}_Number'),
                    style: _getTextStyle(context),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        cardDetails.formattedExpiryDate(),
                        key: Key('${_identifier}_ExpiryDate'),
                        style: _getTextStyle(context),
                      ),
                      SizedBox(
                        width: 40,
                      ),
                      Text(
                        cardDetails.cardType.when(
                          debit: () => 'DEBIT',
                          credit: () => 'CREDIT',
                        ),
                        key: Key('${_identifier}_CardType'),
                        style: _getTextStyle(context),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 40,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  TextStyle _getTextStyle(BuildContext context) {
    return Theme.of(context).textTheme.headline5!.copyWith(
          fontFamily: 'OCR-A',
          color: Colors.white,
          shadows: _textShadows,
        );
  }
}

String _getCardBackgroundPath(CardBrand cardBrand) {
  return cardBrand.maybeWhen(
    orElse: () => '',
    visa: () => 'packages/widget_library/assets/cards/green-visa.svg',
    mastercard: () =>
        'packages/widget_library/assets/cards/orange-mastercard.svg',
    dinersInternational: () =>
        'packages/widget_library/assets/cards/pink-diners.svg',
    dinersUSA: () => 'packages/widget_library/assets/cards/pink-diners.svg',
    amex: () => 'packages/widget_library/assets/cards/blue-amex.svg',
    mada: () => 'packages/widget_library/assets/cards/yellow-mada.svg',
    chinaUnionPay: () => 'packages/widget_library/assets/cards/orange-cup.svg',
  );
}
