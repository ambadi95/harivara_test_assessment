String deleteCardQuery(int walletId, String cardId) => ''' 
mutation deleteCard {
  deleteCardFromWallet(options: { cardId: "$cardId", walletId: $walletId }) {
    ... on DeleteCard {
      delete
    }
    ... on Error {
      status
      message
    }
  }
} 
  ''';
