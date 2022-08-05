import 'package:flutter/material.dart';
import 'package:shared_data_models/card_wallet/card_wallet.dart';

class CrayonPaymentRowCardTitle extends StatelessWidget {
  final String title;

  const CrayonPaymentRowCardTitle({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        // TODO: implement the fontfamily.
        // Probably we need to import 'Brown' font from assets.
        fontSize: 14,
      ),
    );
  }
}

class CrayonPaymentRowCardSubtitle extends StatelessWidget {
  final String text;

  const CrayonPaymentRowCardSubtitle({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        // TODO: implement the fontfamily.
        // Probably we need to import 'Brown' font from assets.
        fontSize: 14,
        color: Color(0xFF838383),
      ),
    );
  }
}

class CrayonPaymentRowCard extends StatelessWidget {
  final CardWallet cardDetails;
  final Function()? onTapCallback;
  final bool isSelected;
  final bool displayCardTypeInfo;

  CrayonPaymentRowCard({
    Key? key,
    required this.cardDetails,
    required this.isSelected,
    this.onTapCallback,
    this.displayCardTypeInfo = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      key: const Key('CrayonPaymentRowCard_RowCard'),
      onTap: onTapCallback,
      behavior: HitTestBehavior.opaque,
      child: Stack(
        children: [
          if (isSelected) ...[
            Container(
              key: const Key('row_card_check'),
              alignment: Alignment.centerRight,
              child: const FractionalTranslation(
                translation: Offset(0.45, -0.45),
                child: CircleAvatar(
                  backgroundColor: Color(0xFFE3AF4C),
                  radius: 15,
                  child: Icon(
                    Icons.check,
                    color: Color(0xFFFFFFFF),
                  ),
                ),
              ),
            ),
          ],
          Container(
            padding: const EdgeInsets.fromLTRB(
              15.0,
              17.0,
              12.0,
              17.0,
            ),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(
                Radius.circular(8),
              ),
              border: Border.all(
                color: isSelected
                    ? const Color(0xFFE3AF4C)
                    : const Color(0x00FFFFFF),
              ),
            ),
            child: Row(
              children: [
                SizedBox(
                  key: const Key('CrayonPaymentRowCardIcon_RowCardIcon'),
                  width: 92,
                  height: 56,
                  child: Image(image: cardDetails.image),
                ),
                const SizedBox(
                  width: 18.0,
                ),
                Column(
                  key: const Key('CrayonPaymentRowCardTitles_RowCardTitles'),
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CrayonPaymentRowCardTitle(
                      key: const Key('CrayonPaymentRowCardTitle_RowCardTitle'),
                      title: cardDetails.cardNickName,
                    ),
                    if (displayCardTypeInfo) ...[
                      CrayonPaymentRowCardSubtitle(
                        key: const Key('CrayonPaymentRowCardType_RowCardType'),
                        text: cardDetails.cardType.when(
                          debit: () => 'Debit',
                          credit: () => 'Credit',
                        ),
                      ),
                    ],
                    // TODO: we need to implement a function that formats the cardNumber
                    // dependent of the card type (e.g. American express or visa/mastercard).
                    CrayonPaymentRowCardSubtitle(
                      key:
                          const Key('CrayonPaymentRowCardNumber_RowCardNumber'),
                      text: '**** **** **** ' + cardDetails.last4Digits,
                    ),
                    CrayonPaymentRowCardSubtitle(
                      key: const Key(
                          'CrayonPaymentRowCardExpiryDate_RowCardExpiryDate'),
                      text: 'Expiry ' +
                          cardDetails.expiryMonth.toString() +
                          '/' +
                          cardDetails.expiryYear.toString(),
                    ),
                  ],
                ),
                const Spacer(),
                const Icon(
                  Icons.keyboard_arrow_right,
                  key: Key('CrayonPaymentRowCardArrow_RowCardArrow'),
                  // TODO: we need to define the correct size -> check with the UI team
                  color: Color(0xFFD1CFC9),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
