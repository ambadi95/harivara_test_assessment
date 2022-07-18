const utils = require('../../utilities/commonUtils');
const addFundScreen = require('../../test/screens/addFunds.screen');

class AddFundsPage {
    shouldSeeAddFundsPage() {
        utils.waitForElement(addFundScreen.heading, true);
    }

    clickCardsList() {
        utils.clickOnElement(addFundScreen.select_card);
    }

    clickAddNewCard() {
        utils.clickOnElement(addFundScreen.add_new_card_button);
    }

    enterAmount(amount) {
        [...amount].forEach(key => utils.clickOnElement(addFundScreen.key_to_press(key)));
    }

    clickAddFundsButton() {
        utils.clickOnElement(addFundScreen.add_funds_button);
    }

    shouldSeeDefaultCard() {
        utils.waitForElement(addFundScreen.primary_card, true);
    }

    clickOnDefaultCard() {
        utils.clickOnElement(addFundScreen.default_card)
    }

    shouldSelectSecondaryCard() {
        utils.clickOnElement(addFundScreen.secondary_card);
    }

    shouldSeeSelectModal() {
        utils.waitForElement(addFundScreen.select_card_modal_heading, true)
    }

    clickOnClose() {
        utils.clickOnElement(addFundScreen.close_icon);
    }

    shouldSeeTheFields(tableData) {
        tableData.forEach(data => {
            switch (data[0]) {
                case 'amount field':
                    utils.waitForElement(addFundScreen.amount_field, true);
                    break;
                case 'card selection':
                    utils.waitForElement(addFundScreen.default_card, true);
                    break;
                case 'heading':
                    utils.waitForElement(addFundScreen.heading, true);
                    break
                default:
                    throw new Error(`${data[0]} - not found.`);
            }
        });
    }

    addFundButtonIsDisabled(isEnabled) {
        utils.isEnabledElement(addFundScreen.add_funds_button, true);
    }

    shouldSeeErrorMessage() {
        utils.waitForElement(addFundScreen.errorMessage, true);
    }

    shouldSeeRequiredFields(tableData) {
        tableData.forEach(data => {
            switch (data[0]) {
                case 'amount_field':
                    utils.waitForElement(addFundScreen.amount_field, true);
                    break;
                case 'current_balance':
                    utils.waitForElement(addFundScreen.currentBalance, true);
                    break;
                case 'Remaining_balance':
                    utils.waitForElement(addFundScreen.remainingBalance, true);
                    break;
                default:
                    throw new Error(` ${data} not found in add fund screen`);
            }
        });
    }

    clickBackButton() {
        utils.clickOnElement(addFundScreen.back_button);
    }
}

export default new AddFundsPage();
