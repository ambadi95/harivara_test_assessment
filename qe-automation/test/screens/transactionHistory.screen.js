const find = require('appium-flutter-finder');

module.exports = {
    transaction_history_title: find.byValueKey('TransactionsScreen_Title'),
    Search_bar: find.byValueKey('SearchBarWidget_TextField'),
    TransactionType_ALL: find.byValueKey('selected-container-0'),
    TransactionType_OUT: find.byValueKey('selected-container-1'),
    TransactionType_IN: find.byValueKey('selected-container-2'),
    Duration: find.bySemanticsLabel('Filter transactions button'),
    noTransactionMessage: find.byText('No transactions available'),
    transaction: find.descendant({
        of: find.byType('Column'),
        matching: find.byType('Column'),
        firstMatchOnly: true
    }),
    mainSection: find.byValueKey('transactionIdTile'),
    expandOption: find.byValueKey('title_text'),
    downloadJPG: find.byValueKey('download_button'),
    transactionDetail_heading: find.byValueKey('Text'),
    share_button: find.byValueKey('share_button'),
    success_popup: find.byValueKey('CrayonPaymentSnackbarWidgettitle'),
    back_button: find.byValueKey('CrayonPaymentAppBarButtons_BackArrow')
}
