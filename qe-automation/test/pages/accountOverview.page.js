const utils = require('../../utilities/commonUtils');
const accountOverviewScreen = require('../../test/screens/accountOverview.screen');

class AccountOverviewPage {
    shouldSeeAccountOverviewPage() {
        utils.waitForElement(accountOverviewScreen.aov_home_page, true);
    }

    shouldSeeAddFundsOption() {
        utils.waitForElement(accountOverviewScreen.add_money_button, true);
    }

    clickAddFunds() {
        utils.clickOnElement(accountOverviewScreen.add_money_button);
    }

    clickMyAccount() {
        utils.clickOnElement(accountOverviewScreen.my_account_link);
    }

    shouldTransactionHistoryVisible() {
        utils.waitForElement(accountOverviewScreen.transaction_History_Link, true);
    }

    clickTransactionHistoryLink() {
        utils.clickOnElement(accountOverviewScreen.transaction_History_Link);
    }
}

export default new AccountOverviewPage();
