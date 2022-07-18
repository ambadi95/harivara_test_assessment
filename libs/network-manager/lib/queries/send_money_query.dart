String get sendMoneyQuery => ''' 
mutation inititatePaymentTransferP2P(\$options:PaymentTransferRequestInput!) {
  inititatePaymentTransferP2P(
    options: \$options
  ) {
    ... on PaymentTransferP2PResponse{
      serviceRequestId
      reference
      amount {
        amount
        currency
      }
      receiver {
        mobileNumber
      }
      note
      dateTime
    }
    ... on Error{
      message
      status
    }
  }
}
''';
