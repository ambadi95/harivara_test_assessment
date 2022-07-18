import 'package:shared_data_models/card_wallet/card_brand.dart';

class CardModelIdentifier {
  CardBrand identify(String card) {
    if (card.length < 6) {
      return CardBrand.processing();
    }
    var prefix = card.substring(0, 6);
    if (_madaBucket.contains(prefix)) {
      return CardBrand.mada();
    }
    if (_madaMasterCardBucket.contains(prefix)) {
      return CardBrand.madaMasterCard();
    }
    if (_madaVisaBucket.contains(prefix)) {
      return CardBrand.madaVisa();
    }
    prefix = card.substring(0, 2);
    if (_masterCardPrefix.contains(prefix)) {
      return CardBrand.mastercard();
    }
    if (_dinersInternationalPrefix.contains(prefix)) {
      return CardBrand.dinersInternational();
    }
    if (_dinersUSAPrefix.contains(prefix)) {
      return CardBrand.dinersUSA();
    }
    prefix = card.substring(0, 1);
    if (_visaPrefix.contains(prefix)) {
      return CardBrand.visa();
    }
    if (_chinaUnionPayPrefix.contains(prefix)) {
      return CardBrand.chinaUnionPay();
    }
    if (_amexPrefix.contains(prefix)) {
      return CardBrand.amex();
    }
    if (_masterCardPrefix.contains(prefix)) {
      return CardBrand.mastercard();
    }
    return CardBrand.unknown();
  }

  static const List<String> _visaPrefix = ['4'];
  static const List<String> _masterCardPrefix = ['51', '52', '53', '55', '2'];
  static const List<String> _chinaUnionPayPrefix = ['6'];
  static const List<String> _amexPrefix = ['3'];
  static const List<String> _dinersUSAPrefix = ['54'];
  static const List<String> _dinersInternationalPrefix = ['36'];
  static const List<String> _madaVisaBucket = [
    '440647',
    '440795',
    '446404',
    '457865',
    '493428',
    '417633',
    '468540',
    '468541',
    '468542',
    '468543',
    '446393',
    '588847',
    '400861',
    '409201',
    '458456',
    '484783',
    '462220',
    '455708',
    '455036',
    '486094',
    '486095',
    '486096',
    '440533',
    '489317',
    '489318',
    '489319',
    '445564',
    '401757',
    '410685',
    '432328',
    '428671',
    '428672',
    '428673',
    '446672',
    '434107',
    '431361',
    '422817',
    '422818',
    '422819',
    '428331',
    '483010',
    '483011',
    '483012',
    '419593',
    '439954',
    '407197',
    '407395',
    '412565',
    '457997',
    '406996',
    '449197'
  ];
  static const List<String> _madaMasterCardBucket = [
    '588845',
    '588846',
    '539931',
    '558848',
    '558848',
    '557606',
    '588848',
    '504300',
    '543357',
    '521076',
    '588850',
    '535825',
    '529415',
    '543085',
    '524130',
    '554180',
    '549760',
    '588849',
    '524514',
    '529741',
    '537767',
    '535989',
    '536023',
    '513213',
    '585265',
    '588983',
    '588982',
    '589005',
    '508160',
    '531095',
    '530906',
    '532013',
    '588851',
    '589206',
    '520058',
    '530060',
    '531196',
    '506968'
  ];
  static const List<String> _madaBucket = [
    '968208',
    '968210',
    '636120',
    '968201',
    '968205',
    '968203',
    '968211',
    '968206',
    '604906',
    '968202',
    '968209',
    '605141',
    '968204',
    '968207'
  ];
}
