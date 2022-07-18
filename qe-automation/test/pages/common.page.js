const utils = require('../../utilities/commonUtils');
const commonScreen = require('../../test/screens/common.screen');

class CommonPage {
    clickBackButton() {
        utils.waitForElement(commonScreen.back_button, true);
        utils.clickOnElement(commonScreen.back_button);
    }

    clickDeviceBackButton() {
        utils.clickDeviceBackButton();
    }

    relaunchApp() {
        utils.relaunchApp();
    }
}

export default new CommonPage();
