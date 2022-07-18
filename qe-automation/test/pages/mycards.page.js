const utils = require('../../utilities/commonUtils');
const myCardsScreen = require('../../test/screens/mycards.screen');

class MyCardsPage {
    shouldSeeCardListPage() {
        utils.waitForElement(myCardsScreen.heading, true);
    }

    shouldSeeAddACardTile() {
        utils.waitForElement(myCardsScreen.add_card_tile, true);
    }

    shouldSeeAddACardLink() {
        utils.waitForElement(myCardsScreen.add_new_card_link, true);
    }

    isVisibleCardsList(isVisible) {
        utils.waitForElement(myCardsScreen.cards_list, isVisible);
    }

    clickAddACardTile() {
        utils.clickOnElement(myCardsScreen.add_card_tile);
    }

    clickAddNewCardLink() {
        utils.clickOnElement(myCardsScreen.add_new_card_link);
    }

    shouldSeeAddCardOverlay() {
        utils.waitForElement(myCardsScreen.info_overlay, true);
        utils.waitForElement(myCardsScreen.overlay_cancel_button, true);
        utils.waitForElement(myCardsScreen.overlay_continue_button, true);
    }

    clickOverlayContinueButton() {
        utils.clickOnElement(myCardsScreen.overlay_continue_button);
    }

    clickOverlayCancelButton() {
        utils.clickOnElement(myCardsScreen.overlay_cancel_button);
    }

    clickBackButton() {
        utils.clickOnElement(myCardsScreen.back_btn);
    }

    shouldSeeCardInformation(tableData) {
        tableData.forEach(data => {
            switch (data[0]) {
                case 'cardName':
                    utils.waitForElement(myCardsScreen.card_name, true);
                    break;

                case 'cardNumber':
                    utils.waitForElement(myCardsScreen.card_number, true);
                    break;

                case 'expiryDate':
                    utils.waitForElement(myCardsScreen.card_expiry_date, true);
                    break;

                case 'preferredCard_heading':
                    utils.isVisibleElement(myCardsScreen.preferredCard_heading, true);
                    break;

                case 'greenTick_onPreferredCard':
                    utils.isVisibleElement(myCardsScreen.greenTick_onPreferredCard, true);
                    break;

                case 'changeNickName_link':
                    utils.isVisibleElement(myCardsScreen.changeNickName_link, true);
                    break;

                case 'DeleteCard_link':
                    utils.isVisibleElement(myCardsScreen.DeleteCard_link, true);
                    break;

                case 'Transaction_placeholder':
                    utils.isVisibleElement(myCardsScreen.Transaction_placeholder, true);
                    break;

                default:
                    throw new Error(`Card detail - ${data} - not found.`);
            }
        });
    }

    shouldSeeCardWithDetails(tableData, isDefault) {
        utils.waitForElement(myCardsScreen.card_number);
        const expectedCard = tableData[0]['cardNumber'];
        const actualCard = utils.getText(myCardsScreen.card_number);

        if (isDefault) {
            expect(utils.getText(myCardsScreen.card_name)).to.equal(tableData[0]['nickName']);
            expect(actualCard.substr(actualCard.length - 5)).to.equal(expectedCard.substr(expectedCard.length - 5));
        } else {
            expect(utils.getText(myCardsScreen.card_name)).to.not.equal(tableData[0]['nickName']);
            expect(actualCard.substr(actualCard.length - 5)).to.not.equal(expectedCard.substr(expectedCard.length - 5));
        }
        utils.waitForElement(myCardsScreen.card_preferred_icon, true);
    }

    shouldNotSeeToggleButton() {
        utils.isVisibleElement(myCardsScreen.toggle_button, false);
    }
}

export default new MyCardsPage();
