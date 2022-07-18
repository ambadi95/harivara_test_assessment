const utils = require('../../utilities/commonUtils');
const loginScreen = require('../screens/login.screen');
let isDeviceEnrolled = false;

class LoginPage {
    shouldSeeLoginPage() {
        isDeviceEnrolled = utils.isVisibleElement(loginScreen.enter_passcode_screen);

        if (isDeviceEnrolled) {
            utils.waitForElement(loginScreen.enter_passcode_screen, true);
        } else {
            utils.waitForElement(loginScreen.sign_in_button, true);
            utils.clickOnElement(loginScreen.sign_in_button);

            // based on global language variable
            if (global.language === 'AR') {
                utils.clickOnElement(loginScreen.lang_dropdown);
                utils.clickOnElement(loginScreen.arabic_lang);
            }
        }
    }

    enterUsername() {
        if (!isDeviceEnrolled) {
            utils.waitForElement(loginScreen.customer_id, true);
            utils.enterText(loginScreen.customer_id, testData['username']);
        }
    }

    enterPassword() {
        if (isDeviceEnrolled) {
            [...testData['password']].forEach(key => utils.clickOnElement(loginScreen.key_to_press(key)));
        } else {
            utils.enterText(loginScreen.passcode, testData['password']);
        }
    }

    clickLoginButton() {
        if (!isDeviceEnrolled) {
            utils.clickOnElement(loginScreen.sign_in);
        }
    }

    setUserDetails(userType) {
        utils.setUserData(userType);
    }
}

export default new LoginPage();
