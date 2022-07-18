const utils = require('../../utilities/commonUtils');
const cvvScreen = require('../../test/screens/cvv.screen');

class cvvPage {
    enterCVV(cvv) {
        [...cvv].forEach(key => utils.clickOnElement(cvvScreen.cvv_text_field(key)));
    }

    clickAddFundsBtn() {
        utils.clickOnElement(cvvScreen.add_funds_btn);
    }

    verifyCVVScreenTitle() {
        utils.waitForElement(cvvScreen.cvv_screen_title);
    }

    verifySuccessTitle() {
        utils.waitForElement(cvvScreen.success_screen_title);
    }

    verifyUnsuccessfulTitle() {
        utils.waitForElement(cvvScreen.error_message, true);
    }

    shouldSeeAddFundsBtn() {
        utils.waitForElement(cvvScreen.add_funds_btn, true);
    }
}

export default new cvvPage();
