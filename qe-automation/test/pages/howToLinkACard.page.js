const utils = require('../../utilities/commonUtils');
const howToLinkACardScreen = require('../../test/screens/howToLinkACard.screen');

class HowToLinkACardPage {
    shouldSeeHowToLinkACardPage(isVisible) {
        utils.scrollUntilVisible(howToLinkACardScreen.list_view, howToLinkACardScreen.heading, 'up');
        utils.waitForElement(howToLinkACardScreen.heading, isVisible);
    }

    isVisibleHowToDescription(isVisible) {
        utils.waitForElement(howToLinkACardScreen.how_to_icon, isVisible);
        utils.waitForElement(howToLinkACardScreen.how_to_text, isVisible);
    }

    isVisibleContinueButton() {
        utils.waitForElement(howToLinkACardScreen.continue_button, true);
    }

    clickContinueButton() {
        utils.scrollUntilVisible(howToLinkACardScreen.list_view, howToLinkACardScreen.continue_button, 'down');
        utils.clickOnElement(howToLinkACardScreen.continue_button);
    }

    clickBackButton() {
        utils.clickOnElement(howToLinkACardScreen.back_button);
    }
}

export default new HowToLinkACardPage();
