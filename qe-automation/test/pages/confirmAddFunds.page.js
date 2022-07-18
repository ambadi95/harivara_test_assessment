const utils = require('../../utilities/commonUtils');
const confirmAddFunds = require('../../test/screens/confirmAddFunds.screen');

class confirmAddFundsPage {
    clickAddFunds() {
        utils.clickOnElement(confirmAddFunds.addFunds_btn);
    }

    clickBackButton() {
        utils.clickOnElement(confirmAddFunds.back_button);
    }
}

export default new confirmAddFundsPage();
