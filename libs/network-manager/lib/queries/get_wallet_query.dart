String getWalletQuery(String walletId) => ''' 
  query getWalletDetails{
      getWallet(walletId:$walletId){
          ... on Wallet{
                cardDetails{
                  walletId
                  cardNumber
                  cardType
                  brand
                  nickName
                  cardId
                  expiryYear
                  expiryMonth
                  favourite
                }
              balance{
                amount
                currency
              }
              walletId
              limit
              }
          ... on Error{
                message 
                status
              }
      }
  }
  ''';
