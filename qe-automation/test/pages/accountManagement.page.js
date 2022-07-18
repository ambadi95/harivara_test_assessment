const utils = require('../../utilities/commonUtils');
const accountManagementScreen = require('../../test/screens/accountManagement.screen');

class AccountManagementPage {
    clickManageCards() {
        utils.clickOnElement(accountManagementScreen.manage_cards_link);
    }

    shouldSeeAccountManagementPage() {
        utils.waitForElement(accountManagementScreen.manage_cards_link, true);
    }
}

export default new AccountManagementPage();
