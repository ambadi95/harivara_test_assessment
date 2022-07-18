const utils = require('../../utilities/commonUtils');
const scanYourCardDetailsScreen = require('../../test/screens/scanYourCardDetails.screen');

class ScanYourCardDetailsPage {
    shouldSeeScanYourCardDetailsPage() {
        utils.waitForElement(scanYourCardDetailsScreen.heading, true);
    }

    shouldSeeEnterCardDetailsManuallyLink() {
        utils.waitForElement(scanYourCardDetailsScreen.enter_card_details_manually_link, true);
    }

    clickEnterCardDetailsManually() {
        utils.clickOnElement(scanYourCardDetailsScreen.enter_card_details_manually_link);
    }

    clickBackButton() {
        utils.clickOnElement(scanYourCardDetailsScreen.back_button);
    }
}

export default new ScanYourCardDetailsPage();
