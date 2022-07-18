String getWalletBalanceQuery(String walletId) => ''' 
  query getWalletDetails{
      getWallet(walletId:$walletId){
          ... on Wallet{
              balance{
                amount
                currency
              }
              }
          ... on Error{
                message 
                status
              }
      }
  }
  ''';
