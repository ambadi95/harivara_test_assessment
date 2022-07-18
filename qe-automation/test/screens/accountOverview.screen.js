const find = require('appium-flutter-finder');

module.exports = {
    aov_home_page: find.byValueKey('offersTitleText'),
    add_money_button: find.byValueKey('addFundNavItem'),
    my_account_link: find.byValueKey('dashboard_profile_pic'),
    add_funds_btn: find.byValueKey('addFundNavItem'),
    transaction_History_Link: find.byValueKey('transactionsNavItem')
}
