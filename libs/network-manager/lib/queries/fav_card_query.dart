String favCardQuery(int walletId, String cardId) => '''
mutation MARKASFAVOURITE {
  markAsFavourite(options: { cardId: "$cardId", walletId: $walletId }) {
    ... on FavouriteCard {
      favourite
    }
    ... on Error {
      status
      message
    }
  }
}
  ''';
