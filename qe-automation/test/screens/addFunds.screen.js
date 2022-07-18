const find = require('appium-flutter-finder');

module.exports = {
    heading: find.byValueKey('addFundsTitle'),
    select_card: find.byValueKey("sourceCardContainer"),
    add_new_card_button: find.byValueKey("title"),
    amount_field: find.byValueKey('amountTextField'),
    add_funds_button: find.byValueKey('actionButton'),
    delete_key: find.byValueKey('circleAvatar'),
    default_card: find.byValueKey('cardTitle'),
    primary_card: find.byValueKey('CrayonPaymentRowCardTitle_RowCardTitle'),
    secondary_card: find.byText('Secondary card'),
    select_card_modal_heading: find.byValueKey('BaseView_Consumer'),
    close_icon: find.byValueKey('closeIcon'),
    currentBalance: find.byText('Wallet balance'),
    remainingBalance: find.byValueKey('balanceText'),
    errorMessage: find.byValueKey('errorText'),
    back_button: find.byValueKey('CrayonPaymentAppBarButtons_BackArrow'),
    key_to_press: keyToPress => find.byText(keyToPress)
}
