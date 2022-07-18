import 'package:flutter_test/flutter_test.dart';
import 'package:shared_data_models/account/account_scheme_type.dart';
import 'package:shared_data_models/auth/auth_type.dart';
import 'package:shared_data_models/payment/payment_context_type.dart';
import 'package:shared_data_models/recipient/receipient_details.dart';
import 'package:shared_data_models/recipient/recipient_payment_details.dart';
import 'package:shared_data_models/transaction/transaction_initiator_type.dart';

import '../raw_json_files/raw_json_reader.dart';

void main() {
  setUp(() {});

  group('[RecipientPaymentDetails] - fromJson() -', () {
    test('should return a valid model', () async {
      // Arrange
      final jsonResponse =
          rawJsonToMap('recipient/recipient_payment_details.json');
      final json = jsonResponse['inititatePaymentTransferP2P'];
      // Act
      final RecipientPaymentDetails result =
          RecipientPaymentDetails.fromJson(jsonResponse);
      // Assert
      expect(result, isA<RecipientPaymentDetails>());
      expect(result.note, json['note']);
      expect(result.reference, json['reference']);
      expect(result.dateTime, json['dateTime']);
      expect(
        result.authDetails?.authType,
        isA<MPIN>(),
      );
      expect(
        result.authDetails?.authType.toString(),
        json['authDetails']['authType'],
      );
      expect(
        result.authDetails?.authValue,
        json['authDetails']['authValue'],
      );
      expect(
        result.paymentContextType,
        isA<P2P>(),
      );
      expect(
        result.paymentContextType.toString(),
        json['paymentContextType'],
      );
      expect(
        result.receiver,
        isA<RecipientDetails>(),
      );
      expect(
        result.receiver.mobileNumber,
        json['receiver']['mobileNumber'],
      );
      expect(
        result.receiver.accountSchemeType,
        isA<WALLET>(),
      );
      expect(
        result.receiver.accountSchemeType.toString(),
        json['receiver']['schemeType'],
      );
      expect(
        result.receiver.schemeValue,
        json['receiver']['schemeValue'],
      );
      expect(
        result.sender?.mobileNumber,
        json['sender']['mobileNumber'],
      );
      expect(
        result.sender?.accountSchemeType,
        isA<IBAN>(),
      );
      expect(
        result.sender?.accountSchemeType.toString(),
        json['sender']['schemeType'],
      );
      expect(
        result.sender?.schemeValue,
        json['sender']['schemeValue'],
      );
      expect(
        result.transactionAmount.amount,
        json['amount']['amount'],
      );
      expect(
        result.transactionAmount.currency,
        json['amount']['currency'],
      );
      expect(result.transactionInitiatorType, isA<Sender>());
      expect(
        result.transactionInitiatorType.toString(),
        json['transactionInitiatorType'],
      );
    });
  });
  group('[RecipientPaymentDetails] - toJson() -', () {
    test('should return correct map', () async {
      // Arrange
      final jsonResponse =
          rawJsonToMap('recipient/recipient_payment_details.json');
      final json = jsonResponse['inititatePaymentTransferP2P'];

      final RecipientPaymentDetails result =
          RecipientPaymentDetails.fromJson(jsonResponse);

      final map = result.toJson()['options'];

      expect(map['note'], json['note']);
      expect(map['authDetails']['authType'], json['authDetails']['authType']);
      expect(
        map['authDetails']['authValue'],
        json['authDetails']['authValue'],
      );
      expect(map['paymentContextType'], json['paymentContextType']);
      expect(
        map['receiver']['mobileNumber'],
        json['receiver']['mobileNumber'],
      );
      expect(
        map['receiver']['schemeType'],
        json['receiver']['schemeType'],
      );
      expect(
        map['receiver']['schemeValue'],
        json['receiver']['schemeValue'],
      );
      expect(
        map['sender']['mobileNumber'],
        json['sender']['mobileNumber'],
      );
      expect(
        map['sender']['schemeType'],
        json['sender']['schemeType'],
      );
      expect(
        map['sender']['schemeValue'],
        json['sender']['schemeValue'],
      );
      expect(
        result.transactionAmount.amount,
        json['amount']['amount'],
      );
      expect(
        map['transactionAmount']['currency'],
        json['amount']['currency'],
      );
      expect(
        map['transactionInitiatorType'],
        json['transactionInitiatorType'],
      );
    });
  });
}
