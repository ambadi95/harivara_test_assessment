const find = require('appium-flutter-finder');

module.exports = {
    manage_wallet: find.byValueKey('setting-manage-wallet'),
    manageWalletHeading: find.byValueKey('AccountDetailsScreen_title'),
    copyDetail_button: find.byValueKey('CrayonPaymentDockedButton_ElevatedButton'),
    account: find.byValueKey('AccountDetailsScreen_Placeholdertext'),
    popup_message: find.byValueKey('CrayonPaymentSnackbarWidgettitle'),
    popup_message2: find.byValueKey('CrayonPaymentSnackbarWidgetsubtitle'),
    Bank_name: find.byValueKey('AccountDetailsScreen_BankTitle'),
    IBAN_number: find.byValueKey('AccountDetailsScreen_MyIBAN'),
    server_side_error: find.byText('Sorry,we cannot complete your request'),
    serverError: find.byValueKey('CardListErrorScreen_Title'),
    suberror_title: find.byValueKey('CardListErrorScreen_Subtitle'),
    error_image: find.byValueKey('CardListErrorScreen_ErrorScreenImage'),
    ok_button: find.byValueKey('CrayonPaymentDockedButton_ElevatedButton'),
    homepage: find.byValueKey('profile'),
}
