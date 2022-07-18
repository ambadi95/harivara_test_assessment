const utils = require('../../utilities/commonUtils');
const p2pScreen = require('../../test/screens/p2p.screen');

class PaymentPage {
    clickP2PLink() {
        utils.clickOnElement(p2pScreen.p2p_link);
    }

    shouldSeeP2P() {
        utils.isVisibleElement(p2pScreen.p2p_link, true);
    }

    enterAmount(amount) {
        utils.enterText(p2pScreen.amount_field, amount);
    }

    enterName(name) {
        utils.enterText(p2pScreen.Search_bar, name);
    }

    enterMobileNo(number) {
        utils.enterText(p2pScreen.search_mobileNumber, number);
    }

    enterPasscode(passcode) {
        [...passcode].forEach(key => utils.clickOnElement(p2pScreen.key_to_press(key)));
    }

    shouldSeeRecepientPage() {
        utils.isVisibleElement(p2pScreen.recepient_heading, true);
    }

    clickContact() {
        utils.clickOnElement(p2pScreen.contact_name);
    }

    shouldSeeContact() {
        utils.isVisibleElement(p2pScreen.contact, true);
    }

    shouldSeeSendMoneyPage() {
        utils.isVisibleElement(p2pScreen.sendMoneyPage, true);
    }

    shouldSeeSendMoneyFields(tableData) {
        tableData.forEach(data => {
            switch (data[0]) {
                case 'amount_field':
                    utils.isVisibleElement(p2pScreen.amount_field, true);
                    break;

                case 'remark':
                    utils.isVisibleElement(p2pScreen.remark, true);
                    break;

                case 'wallet_balance':
                    utils.isVisibleElement(p2pScreen.wallet_balance, true);
                    break;

                case 'contact_number':
                    utils.isVisibleElement(p2pScreen.contact_number, true);
                    break;
                case 'contact_name':
                    utils.isVisibleElement(p2pScreen.contact_name, true);
                    break;

                default:
                    throw new Error(`send money detail - ${data} - not found.`);
            }
        });
    }

    shouldSeeTransferToFields(tableData) {
        tableData.forEach(data => {
            switch (data[0]) {
                case 'contacts_tab':
                    utils.isVisibleElement(p2pScreen.contacts_tab, true);
                    break;

                case 'mobileNumber_Tab':
                    utils.isVisibleElement(p2pScreen.mobileNumber_Tab, true);
                    break;

                case 'Search_bar':
                    utils.isVisibleElement(p2pScreen.Search_bar, true);
                    break;

                case 'contact_list':
                    utils.isVisibleElement(p2pScreen.contact_name, true);
                    break;
                default:
                    throw new Error(`send money detail - ${data} - not found.`);
            }
        });
    }

    enterRemarks() {
        utils.enterText(p2pScreen.remark, 'Money for dinner');
    }

    shouldSeeSendMoneyButton() {
        utils.isVisibleElement(p2pScreen.sendMoney, true);
    }

    clickSendMoney() {
        utils.clickOnElement(p2pScreen.sendMoney);
    }

    shouldSeePasscodeScreen(tableData) {
        tableData.forEach(data => {
            switch (data[0]) {
                case 'heading':
                    utils.isVisibleElement(p2pScreen.payment_heading, true);
                    break;

                case 'amount_tosend':
                    utils.isVisibleElement(p2pScreen.payment_subheading, true);
                    break;

                case 'passcode_field':
                    utils.isVisibleElement(p2pScreen.passcode_payment, true);
                    break;

                case 'icon':
                    utils.isVisibleElement(p2pScreen.face_id, true);
                    break;
                case 'forgot_passcode_link':
                    utils.isVisibleElement(p2pScreen.forgot_passcode, true);
                    break;
                default:
                    throw new Error(`send money detail - ${data} - not found.`);
            }
        });
    }

    shouldSeeConfirmationScreenFields(tableData) {
        tableData.forEach(data => {
            switch (data[0]) {
                case 'amount':
                    utils.isVisibleElement(p2pScreen.amount_confirm, true);
                    break;
                case 'date_time':
                    utils.isVisibleElement(p2pScreen.date_time, true);
                    break;
                case 'note':
                    utils.isVisibleElement(p2pScreen.note, true);
                    break;
                case 'reference':
                    utils.isVisibleElement(p2pScreen.reference, true);
                    break;
                case 'share_button':
                    utils.isVisibleElement(p2pScreen.share_btn, true);
                    break;
                case 'download_button':
                    utils.isVisibleElement(p2pScreen.download_btn, true);
                    break;
                case 'makeAnother_transafer_button':
                    utils.isVisibleElement(p2pScreen.make_another_transfer_btn, true);
                    break;
                default:
                    throw new Error(`send money detail - ${data} - not found.`);
            }
        });
    }

    clickSendMoneyButton() {
        utils.clickOnElement(p2pScreen.sendMoney);
    }

    shouldSeeErrorMessage() {
        utils.waitForElement(p2pScreen.errorMessage, true);
    }

    shouldSeeExceedingErrorMessage() {
        utils.waitForElement(p2pScreen.errorMessage, true);
    }

    shouldSeeErrorNoContacts() {
        utils.isVisibleElement(p2pScreen.error_noContacts, true);
    }

    clickMobileNumber() {
        utils.clickOnElement(p2pScreen.mobileNumber_Tab);
    }

    shouldSeePaymentConfirmation() {
        utils.isVisibleElement(p2pScreen.payment_confirmation, true);
    }

    shouldSeeInvalidPasscodeError() {
        utils.isVisibleElement(p2pScreen.incorrect_passcode, true);
    }

    shouldSeeForgotPopup() {
        utils.isVisibleElement(p2pScreen.contact, true);
        utils.isVisibleElement(p2pScreen.contact_number, true);
        utils.isVisibleElement(p2pScreen.enterPasscode_link, true);
    }

    clickEnterPasscodeLink() {
        utils.clickOnElement(p2pScreen.enterPasscode_link);
    }

    shouldSeeAccountLockPopup() {
        utils.isVisibleElement(p2pScreen.contact, true);
        utils.isVisibleElement(p2pScreen.contact_number, true);
        utils.clickOnElement(p2pScreen.ok_button, true);
    }

    clickOkButton() {
        utils.clickOnElement(p2pScreen.ok_button);
    }

    clickDownloads() {
        utils.clickOnElement(p2pScreen.download_btn);
    }

    clickShareButton() {
        utils.clickOnElement(p2pScreen.share_btn);
    }

    clickAnotherTransferButton() {
        utils.clickOnElement(p2pScreen.make_another_transfer_btn);
    }

    clickOnBackButton() {
        utils.clickOnElement(p2pScreen.back_button);
    }
}

export default new PaymentPage();
