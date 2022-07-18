const utils = require('../../utilities/commonUtils');
const cardDetailsScreen = require('../../test/screens/cardDetails.screen');

class CardDetailsPage {
    shouldSeeCardDetailsPage() {
        utils.waitForElement(cardDetailsScreen.heading, true);
    }

    shouldSeeCardDetailFields(tableData) {
        tableData.forEach(data => {
            switch (data[0]) {
                case 'nickname':
                    utils.waitForElement(cardDetailsScreen.nickname, true);
                    break;

                case 'cardNumber':
                    utils.waitForElement(cardDetailsScreen.card_number, true);
                    break;

                case 'expiryDate':
                    utils.waitForElement(cardDetailsScreen.card_expiry_date, true);
                    break;

                case 'cvv':
                    utils.waitForElement(cardDetailsScreen.card_cvv, true);
                    break;

                case 'preferredCardSwitch':
                    utils.waitForElement(cardDetailsScreen.preferred_card, true);
                    break;

                default:
                    throw new Error(`Card details field - ${data} - not found.`);
            }
        });
    }

    validateFieldData(tableData) {
        tableData.forEach(data => {
            switch (data['field']) {
                case 'nickname' :
                    data['type'] !== 'default' ?
                        this.enterNickname(data['enteredValue']) :
                        utils.clearTextField(cardDetailsScreen.nickname);
                    expect(data['expectedValue']).to.equal(utils.getText(cardDetailsScreen.nickname));
                    break;

                default:
                    throw new Error(`Invalid data type ${data}`);
            }
        })

    }

    enterNickname(nickName) {
        utils.enterText(cardDetailsScreen.nickname, nickName);
    }

    enterCardNumber(cardNumber) {
        utils.enterText(cardDetailsScreen.card_number, cardNumber);
        utils.enterText(cardDetailsScreen.card_number, cardNumber);
    }

    enterExpiryDate(expiryDate) {
        browser.switchContext('NATIVE_APP');
        browser.isAndroid ?
            $(cardDetailsScreen.expiry_date_android).click() :
            $(cardDetailsScreen.expiry_date_ios).click();
        browser.switchContext('FLUTTER');
        utils.clickOnElement(cardDetailsScreen.picker_wheel_done);
    }

    enterCvv(cvv) {
        utils.enterText(cardDetailsScreen.card_cvv, cvv);
    }

    setPreferredCard(isPreferred) {
        isPreferred && utils.clickOnElement(cardDetailsScreen.preferred_card);
    }

    isVisibleCardScheme(tableData) {
        tableData.forEach(data => {
            utils.clearTextField(cardDetailsScreen.card_number);
            this.enterCardNumber(data['card_number']);
            switch (data['card_scheme']) {
                case 'visa' :
                    utils.waitForElement(cardDetailsScreen.card_scheme_visa, true);
                    break;

                case 'mastercard' :
                    utils.waitForElement(cardDetailsScreen.card_scheme_mastercard, true);
                    break;

                case 'chinaUnionPay' :
                    utils.waitForElement(cardDetailsScreen.card_scheme_chinaUnionPay, true);
                    break;

                case 'amex' :
                    utils.waitForElement(cardDetailsScreen.card_scheme_amex, true);
                    break;

                case 'dinersClub' :
                    utils.waitForElement(cardDetailsScreen.card_scheme_dinersClub, true);
                    break;

                case 'dinersClubIntl' :
                    utils.waitForElement(cardDetailsScreen.card_scheme_dinersClubIntl, true);
                    break;

                case 'mada' :
                    utils.waitForElement(cardDetailsScreen.card_scheme_mada, true);
                    break;

                case 'madaMasterCard' :
                    utils.waitForElement(cardDetailsScreen.card_scheme_mada, true);
                    utils.waitForElement(cardDetailsScreen.card_scheme_mastercard, true);
                    break;

                case 'madaVisa' :
                    utils.waitForElement(cardDetailsScreen.card_scheme_mada, true);
                    utils.waitForElement(cardDetailsScreen.card_scheme_visa, true);
                    break;

                default:
                    throw new Error(`Incorrect card scheme ${cardScheme}.`);
            }
        })
    }

    isEnabledContinueButton(isEnabled) {
        utils.isEnabledElement(cardDetailsScreen.continue_button, true);
    }

    clickContinueButton() {
        utils.clickOnElement(cardDetailsScreen.continue_button);
    }

    shouldSeeAddCardModal() {
        utils.waitForElement(cardDetailsScreen.card_added_modal, true);
    }

    closeAddCardModal() {
        utils.clickOnElement(cardDetailsScreen.modal_close_Icon);
    }

    shouldSeeCardNotAddedErrorModal() {
        utils.waitForElement(cardDetailsScreen.card_error_modal, true);
    }
}

export default new CardDetailsPage();
