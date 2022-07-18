const utils = require('../../utilities/commonUtils');
const errorScreen = require('../../test/screens/error.screen');

class ErrorPage {
    shouldSeeErrorPage() {
        utils.waitForElement(errorScreen.error_page, true);
    }

    shouldSeeErrorMessage() {
        utils.waitForElement(errorScreen.error_message, true);
    }
}

export default new ErrorPage();
