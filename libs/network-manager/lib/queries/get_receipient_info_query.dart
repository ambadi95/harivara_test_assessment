String getReceipientInfoQuery(String phoneNumber) => ''' 
query getReceipientInfo {
  getReceipientInfo(
    options: {
      phoneNumber: "$phoneNumber"
    }
  ) {
    ... on RecipientInfo{
      phoneNumber
      recipientStatus
    }
    ... on Error {
      status
      message
    }
  }
}
''';
