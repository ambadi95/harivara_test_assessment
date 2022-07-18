String getBankDetailsQuery(String mobileNo) => '''
query getIBANInformation {
  getIBANInfo(mobileNo: "$mobileNo") {
    ... on IBANResponse {
      bankName
      ibanNumber
      __typename
    }
    ... on Error {
      status
      message
      __typename
    }
  }
}

''';
